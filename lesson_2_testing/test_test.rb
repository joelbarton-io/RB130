# in temp.rb
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class MyFirstTest < Minitest::Test
  def test_first_test
    refute false
  end
end
