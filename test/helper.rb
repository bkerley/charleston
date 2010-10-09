require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'fakefs'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'charleston'

class Test::Unit::TestCase
end
