Charleston::Transform.new 'stylesheets', '*.css', 'stylesheets', '*.css' do |input, output|
  FileUtils.cp input, output
end

Charleston::Transform.new 'stylesheets', '*.sass', 'stylesheets', '*.css' do |input, output|
  sh 'sass', input, output
end
