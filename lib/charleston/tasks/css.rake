@css_transform = Charleston::Transform.new 'stylesheets', '*.css', 'stylesheets', '*.css' do |input, output|
  FileUtils.cp input, output
end
@css_transform.generates 'css'

@sass_transform = Charleston::Transform.new 'stylesheets', '*.sass', 'stylesheets', '*.css' do |input, output|
  sh 'sass', input, output
end
@sass_transform.generates 'sass'
