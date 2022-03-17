require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class TypeTest < MiniTest::Test
  def set_up
    @list = list
    def @list.process; self; end
  end

  def test_same_obj
    assert_same(@list, @list.process)
  end
end
