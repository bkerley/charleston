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
          @directory_name = "directory name"
          @template_directory = File.expand_path(File.join(File.dirname(__FILE__), *%w{ .. lib charleston template}))
          FakeFS::FileSystem.clone @template_directory
          subject.call(@directory_name)
        end

        should 'create the directory' do
          assert File.directory?(@directory_name)
        end

        before_should 'create a generator with the directory name' do
          Charleston::Generator.expects(:new).once.with("directory name")
        end

        before_should 'copy the template' do
          FileUtils.expects(:cp_r).once.with do |from, to|
            from_right = File.expand_path(from) == @template_directory
            to_right = to == @directory_name
            from_right && to_right
          end
        end
      end
    end
  end
end
