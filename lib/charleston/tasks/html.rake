@html_transform = Charleston::Transform.new 'pages', '*.html', '', '*.html' do |input, output|
  FileUtils.cp input, output
end
@html_transform.generates 'html'

@haml_transform = Charleston::Transform.new 'pages', '*.haml', '', '*.html' do |input, output|
  sh 'haml', input, output
end
@haml_transform.generates 'haml'
