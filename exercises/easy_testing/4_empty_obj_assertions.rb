require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class EmptyObjectTest < MiniTest::Test
  def set_up
    @actual # some collection
    @expected = false
  end

  def test_empty
    assert_empty(@actual)
    assert_equal(@expected, @actual.empty?)
  end
end