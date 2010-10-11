@sass_transform = Charleston::Transform.new 'stylesheets', '*.sass', 'stylesheets', '*.css' do |input, output|
  sh 'sass', input, output
end
@sass_transform.generates 'sass'
