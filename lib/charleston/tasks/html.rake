Charleston::Transform.new 'pages', '*.html', '', '*.html' do |input, output|
  FileUtils.cp input, output
end

Charleston::Transform.new 'pages', '*.haml', '', '*.html' do |input, output|
  sh 'haml', input, output
end

