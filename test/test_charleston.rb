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
end
