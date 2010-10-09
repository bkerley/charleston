require 'helper'

class TestCharleston < Test::Unit::TestCase
  context 'the Charleston module' do
    subject { Charleston }
    context 'create_project module method' do
      subject { Charleston.method(:create_project) }
      should 'take one argument' do
        assert_equal 1, subject.arity
      end

      context 'when called with a directory name' do
        setup do
          subject.call("directory name")
        end

        should 'create the directory' do
          assert File.directory?("directory name")
        end

        before_should 'create a generator with the directory name' do
          Charleston::Generator.expects(:new).once.with("directory name")
        end
      end
    end
  end
end
