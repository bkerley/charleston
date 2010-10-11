@images = Rake::FileList['images/*']
@image_output = @images.map{ |i| "output/#{i}" }

@images.zip(@image_output) do |a|
  input, output = a
  file output => [input, 'output/images'] do
    cp input, output
  end
end

desc 'Copy over images'
task 'generate:images' => %w{ output/images } + @image_output
