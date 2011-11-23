Charleston::Transform.new 'javascripts', '*.js', 'javascripts', '*.js' do |input, output|
  FileUtils.cp input, output
end

Charleston::Transform.new 'javascripts', '*.coffee', 'javascripts', '*.js' do |input, output|
  begin
    sh "coffee -cp #{input} > #{output}"
  rescue RuntimeError => e
    # ">" creates an empty file even if coffee fails.
    FileUtils.rm output

    raise "!!!!\n!! Please install CoffeeScript\n!!!!"
  end
end
