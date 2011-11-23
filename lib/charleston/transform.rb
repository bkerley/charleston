include Rake::DSL

module Charleston
  # A factory for creating transformers that transform source (input) paths to destination (output) paths
  class Transform
    # TODO: make this configurable
    OUTPUT_DIR = "output"

    def initialize(source_directory, source_pattern,
                   destination_directory, destination_pattern,
                   &transformation)
      @source_dir = File.expand_path source_directory
      # supports "html", ".html", and "*.html"
      # Why add a space?  File.extname ".html" => "", File.extname " .html" => ".html"
      @source_ext = source_pattern.include?(".") ? File.extname(" #{source_pattern}")[1..-1] : source_pattern

      @dest_dir = File.expand_path File.join(OUTPUT_DIR, destination_directory)
      @dest_ext = destination_pattern.include?(".") ? File.extname(" #{destination_pattern}")[1..-1] : destination_pattern

      @transformation = transformation

      find_sources
      write_rules
    end

    def input_to_output(input_file)
      File.expand_path input_file.sub(@source_dir, @dest_dir).sub(@source_ext, @dest_ext)
    end

    private
    def find_sources
      # recursive find
      @sources = ::Rake::FileList[Dir.glob(File.join(@source_dir, "**/*.#{@source_ext}"))]
    end

    def write_rules
      @sources.each do |source|
        input = source
        output = input_to_output source

        desc "#{input} => #{output}"
        file output => [input] do
          FileUtils.mkdir_p File.dirname(output)
          @transformation.call input, output
        end

        desc "Generate #{output}"
        task "generate:#{@dest_ext}" => output
        # duplicated, but doesn't matter to rake
        task "generate:all" => "generate:#{@dest_ext}"
      end
    end

  end
end
