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
          FakeFS::FileSystem.clone File.join(File.dirname(__FILE__), 'fixture')
          FakeFS::FileSystem.chdir File.join(File.dirname(__FILE__), 'fixture')
          Charleston::Transform.new('pages', '*.haml', '', '*.html'){ }
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
      end
    end
  end
end
