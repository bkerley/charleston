require File.join(File.dirname(__FILE__), '..', 'charleston')

%w{ directories haml sass }.each do |f|
  load File.join(File.dirname(__FILE__), 'tasks', "#{f}.rake")
end
