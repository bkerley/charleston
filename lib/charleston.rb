module Charleston
  def self.create_project(project_name)
    Dir.mkdir(project_name)
  end
end
