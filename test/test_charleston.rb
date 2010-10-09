require 'helper'

class TestCharleston < Test::Unit::TestCase
  context 'the Charleston module' do
    subject { Charleston }
    context 'create_project module method' do
      subject { Charleston.method(:create_project) }
      should 'take one argument' do
        assert_equal 1, subject.arity
      end
    end
  end

  context 'the "charleston" utility' do
    should 'call the Charleston.create_project method with the directory argument' do
      test_argument = rand(1000).to_s
      Charleston.expects(:create_project).once.with(test_argument)
      run_command_line_with_args test_argument
    end

    should 'puts to stderr at least twice when called with the --help argument' do
      $stderr.expects(:puts).at_least(2)
      run_command_line_with_args '--help'
    end
  end

  def run_command_line_with_args(*args)
    with_argv_as args do
      load File.join(File.dirname(__FILE__), '..', 'bin', 'charleston')
    end
  end

  def with_argv_as(args)
    old_argv = ARGV.dup
    replace_argv_with args
    yield
  ensure
    replace_argv_with old_argv
  end

  def replace_argv_with(args)
    ARGV.clear
    args.each_index { |i| ARGV[i] = args[i]}
  end
end
