require 'rake'
%w{ generator checks transform }.each do |m|
  require File.join(File.dirname(__FILE__), 'charleston', m)
end

module Charleston
  def self.create_project(project_name)
    Charleston::Generator.new project_name
  end
end
