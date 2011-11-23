require File.join(File.dirname(__FILE__), '..', 'charleston')

%w{ html css js image }.each do |f|
  load File.join(File.dirname(__FILE__), 'tasks', "#{f}.rake")
end

desc 'Runs all the Charleston generators'
task 'generate:all'
