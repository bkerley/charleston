module Charleston
  class Transform
    def initialize(source_directory, source_pattern,
                   destination_directory, destination_pattern,
                   &transformation)
      @source_dir = source_directory
      @source_pat = source_pattern
      @dest_dir = destination_directory
      @dest_pat = destination_pattern
      @transformation = transformation

      find_sources
      target_destinations
      write_rules
    end

    def generates(rule_name)
      desc "Transform #{@source_dir}/#{@source_pat} into output/#{@dest_dir}/#{@dest_pat}"
      task "generate:#{rule_name}" => @destinations
      task 'generate:all' => "generate:#{rule_name}"
    end

    private
    def find_sources
      @sources = ::Rake::FileList[File.join(@source_dir, @source_pat)]
    end

    def target_destinations
      src_extension = find_extension_in_pattern(@source_pat)
      dest_extension = find_extension_in_pattern(@dest_pat)
      @destinations = @sources.map do |s|
        File.expand_path(
                             s.sub(@source_dir, File.join('output', @dest_dir)).
                             sub(src_extension, dest_extension))
      end
    end

    def write_rules
      @sources.zip(@destinations) do |p|
        input, output = p
        file output => [input, 'output', File.join('output', @dest_dir)] do
          @transformation.call input, output
        end
      end
    end

    def find_extension_in_pattern(pattern)
      pattern.sub(/\*\./, '')
    end
  end
end
