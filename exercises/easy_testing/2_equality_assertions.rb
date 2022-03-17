require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class EqualityTest < MiniTest::Test
  def set_up
    @actual = 'XYZ'
    @expected = 'xyz'
  end

  def test_downcase
    assert_equal(@expected, @actual.downcase)
  end
end

# assert_equal(expected value, actual value to be tested)
