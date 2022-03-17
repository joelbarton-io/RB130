require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class NilTest < MiniTest::Test
  def set_up
    @actual = actual
  end

  def test_downcase
    assert_nil(@actual)
    # or
    assert_equal(nil, @actual)
  end
end
