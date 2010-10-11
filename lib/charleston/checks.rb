module Charleston
  module Checks
    def self.haml_available?
      available? 'haml'
    end

    def self.available?(executable)
      path_entries.detect do |e|
        FileTest.executable? File.join(e, 'haml')
      end
    end

    def self.path_entries
      ENV['PATH'].split(':')
    end
  end
end
