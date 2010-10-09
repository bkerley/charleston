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

        before_should 'copy the template' do
          FileUtils.expects(:cp_r).once.with do |from, to|
            File.expand_path(from) ==
              File.expand_path(File.join(File.dirname(__FILE__), *%w{ .. lib charleston template})) &&
              to == "directory_name"
          end
        end
      end
    end
  end
end
