require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "charleston"
    gem.summary = %Q{Static HTML site framework}
    gem.description = <<-EOD.lines.map{|l|l.strip}.join(' ')
        Charleston is a framework to build static HTML/CSS/JavaScript sites with
        any combination of HTML, HAML, CSS, SASS, JavaScript, and CoffeeScript,
        that's easy to put together and maintain.
    EOD
    gem.email = "bkerley@brycekerley.net"
    gem.homepage = "http://github.com/bkerley/charleston"
    gem.authors = ["Bryce Kerley"]
    gem.executables = %w{ charleston }

    gem.add_runtime_dependency "rake", "~> 0.8"
    gem.add_runtime_dependency 'haml', '~> 3.0'
    gem.add_runtime_dependency 'sass', '~> 3.1'
    gem.add_runtime_dependency 'rdiscount', '~> 1.6'

    gem.add_development_dependency "shoulda", "~> 2.11"
    gem.add_development_dependency "yard", "~> 0.6"
    gem.add_development_dependency "mocha", "~> 0.9"
    gem.add_development_dependency "fakefs", "~> 0.2"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
