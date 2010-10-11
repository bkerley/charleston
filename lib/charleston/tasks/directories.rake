desc 'Generate output directories'
task 'generate:directories' => ['output', 'output/stylesheets', 'output/javascripts', 'output/images']

directory 'output'
directory 'output/stylesheets'
directory 'output/javascripts'
directory 'output/images'

