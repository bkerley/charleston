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

      context 'called with a directory full of hamls' do
        setup do
          @fixture_directory = File.expand_path(File.join(File.dirname(__FILE__), 'fixture'))
          FakeFS::FileSystem.clone @fixture_directory
          FakeFS::FileSystem.chdir @fixture_directory
          @transform = Charleston::Transform.new(File.join(@fixture_directory, 'pages'), '*.haml', '', '*.html'){ }
        end

        before_should 'make file rules for index and about' do
          %w{ index about }.each do |f|
            Charleston::Transform.any_instance.expects(:file).at_least_once.with do |args|
              output = args.keys.first
              input = args[output]
              next false if args.length > 1
              next false unless output =~ Regexp.new("output/#{f}\\\.html$")
              next false unless input.include? 'output' #directory
              next false unless input.detect{ |v| v =~ Regexp.new("pages/#{f}\\\.haml$")}
              true
            end
          end
        end

        context 'when asked to register rules' do
          setup do
            @transform.generates 'haml'
          end

          before_should 'make a "generate:haml" rule' do
            @transform.expects(:task).with do |args|
              task = args.keys.first
              depends = args[task]
              next false unless args.length == 1
              next false unless task == 'generate:haml'
              next false unless depends.detect{ |v| v =~ /output\/index\.html$/ }
              next false unless depends.detect{ |v| v =~ /output\/about\.html$/ }
              true
            end
          end
        end
      end
    end
  end
end
