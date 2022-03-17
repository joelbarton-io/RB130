require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class TypeTest < MiniTest::Test
  def set_up
    @actual = Numeric.new
    @expected = Numeric
  end

  def test_instance_of
    assert_instance_of(@expected, @actual)
  end
end
