require 'helper'

class TestChecks < Test::Unit::TestCase
  context 'the Charleston::Checks module' do
    subject { Charleston::Checks }
    context 'haml_available? module method' do
      subject { Charleston::Checks.method(:haml_available?) }
      should 'take no arguments' do
        assert subject.arity < 1
      end

      context 'when invoked' do
        setup do
          subject.call
        end

        before_should 'check a haml' do
          fake_path = stub
          fake_path.expects(:split).with(':').returns ['/tmp/test/bin']
          ENV.expects(:[]).with('PATH').returns fake_path
          FileTest.expects(:executable?).with('/tmp/test/bin/haml').returns true
        end
      end
    end
  end
end
