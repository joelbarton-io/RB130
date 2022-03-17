require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class ListTest < MiniTest::Test
  def setup
    @list = ["ho", "l", "z"]
  end

  def test_list_class
    refute_includes(@list, "xyz")
  end
end
