require 'helper'

class TestTransform < Test::Unit::TestCase
  context 'the Charleston::Transform class' do
    subject { Charleston::Transform }
    context 'new method' do
      subject { Charleston::Transform.method(:new)}
      should 'work with four arguments' do
        assert_nothing_raised do
          Charleston::Transform.new 'pages', '*.haml', '', '*.html'
        end
      end

      context 'called with a directory full of hamls' do
        setup do
          FakeFS::FileSystem.clone File.join(File.dirname(__FILE__), 'fixture')
          Charleston::Transform.new 'pages', '*.haml', '', '*.html'
        end

        before_should 'make file rules for index and about' do
          %w{ index about }.each do |f|
            Charleston::Transform.any_instance.expects(:file).
              with("output/#{f}.html" => ["pages/#{f}.haml", 'output'])
          end
        end
      end
    end
  end
end
