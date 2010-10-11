@haml_transform = Charleston::Transform.new 'pages', '*.haml', '', '*.html' do |input, output|
  sh 'haml', input, output
end
@haml_transform.generates 'haml'
