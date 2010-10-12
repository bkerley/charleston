# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{charleston}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bryce Kerley"]
  s.date = %q{2010-10-11}
  s.default_executable = %q{charleston}
  s.description = %q{TODO: longer description of your gem}
  s.email = %q{bkerley@brycekerley.net}
  s.executables = ["charleston"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/charleston",
     "lib/charleston.rb",
     "lib/charleston/checks.rb",
     "lib/charleston/generator.rb",
     "test/fixture/pages/about.haml",
     "test/fixture/pages/contact.html",
     "test/fixture/pages/dev.html",
     "test/fixture/pages/index.haml",
     "test/helper.rb",
     "test/test_charleston.rb",
     "test/test_checks.rb",
     "test/test_transform.rb"
  ]
  s.homepage = %q{http://github.com/bkerley/charleston}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{static HTML framework}
  s.test_files = [
    "test/helper.rb",
     "test/test_charleston.rb",
     "test/test_checks.rb",
     "test/test_transform.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, ["~> 0.8"])
      s.add_development_dependency(%q<shoulda>, ["~> 2.11"])
      s.add_development_dependency(%q<yard>, ["~> 0.6"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9"])
      s.add_development_dependency(%q<fakefs>, ["~> 0.2"])
    else
      s.add_dependency(%q<rake>, ["~> 0.8"])
      s.add_dependency(%q<shoulda>, ["~> 2.11"])
      s.add_dependency(%q<yard>, ["~> 0.6"])
      s.add_dependency(%q<mocha>, ["~> 0.9"])
      s.add_dependency(%q<fakefs>, ["~> 0.2"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 0.8"])
    s.add_dependency(%q<shoulda>, ["~> 2.11"])
    s.add_dependency(%q<yard>, ["~> 0.6"])
    s.add_dependency(%q<mocha>, ["~> 0.9"])
    s.add_dependency(%q<fakefs>, ["~> 0.2"])
  end
end

