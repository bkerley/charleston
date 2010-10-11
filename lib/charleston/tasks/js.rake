@js_transform = Charleston::Transform.new 'javascripts', '*.js', 'javascripts', '*.js' do |input, output|
  FileUtils.cp input, output
end
@js_transform.generates 'javascript'

@cs_transform = Charleston::Transform.new 'javascripts', '*.coffee', 'javascripts', '*.js' do |input, output|
  sh "coffee -cp #{input} > #{output}"
end
@cs_transform.generates 'coffeescript'
