module Charleston
  class Generator
    def initialize(directory_name)
      @target_directory = directory_name

      enumerate_and_populate_directory
    end

    private
    def enumerate_and_populate_directory
      FileUtils::cp_r File.join(File.dirname(__FILE__), 'template'), @target_directory
    end
  end
end
