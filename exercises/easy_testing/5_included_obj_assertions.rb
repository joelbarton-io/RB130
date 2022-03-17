require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class IncludedObjectTest < MiniTest::Test
  def set_up
    @list = list
  end

  def test_include?
    assert_includes(@list, 'xyz')
  end
end
