require 'helper'

class TestTransform < Test::Unit::TestCase
  context 'the Charleston::Transform class' do
    subject { Charleston::Transform }
    context 'new method' do
      subject { Charleston::Transform.method(:new)}
      should 'work with four arguments' do
        assert_nothing_raised do
          Charleston::Transform.new('pages', '*.haml', '', '*.html'){ }
        end
      end

      %w{ .haml *.haml haml }.each do |pattern|
        context "called with a directory full of hamls/htmls and pattern #{pattern}" do
          setup do
            @fixture_directory = File.expand_path(File.join(File.dirname(__FILE__), 'fixture'))
            FakeFS::FileSystem.clone @fixture_directory
            FakeFS::FileSystem.chdir @fixture_directory
            @transform = Charleston::Transform.new(File.join(@fixture_directory, 'pages'), pattern, '', '*.html'){ }
          end

          before_should 'make file rules for all the hamls' do
            %w{ index about subdir/index }.each do |f|
              Charleston::Transform.any_instance.expects(:file).at_least_once.with do |args|
                output = args.keys.first
                input = args[output]
                next false if args.length > 1
                next false unless output =~ Regexp.new("output/#{f}\\\.html$")
                #next false unless input.include? 'output' #directories are created on demand
                next false unless input.detect{ |v| v =~ Regexp.new("pages/#{f}\\\.haml$")}
                true
              end
            end
          end

          before_should 'make a "generate:html" rule and add it to the generate:all rule' do
            %w{ index about subdir/index }.each do |f|
              Charleston::Transform.any_instance.expects(:task).at_least_once.with do |args|
                task = args.keys.first
                depends = args[task]
                next false unless args.length == 1
                next false unless task == 'generate:html'
                next false unless depends =~ Regexp.new("output/#{f}\\\.html$")
                true
              end
            end
            # one for every haml file, which is weird, but ok for now
            Charleston::Transform.any_instance.expects(:task).times(3).with({"generate:all"=>"generate:html"})
          end
        end
      end
    end
  end
end
