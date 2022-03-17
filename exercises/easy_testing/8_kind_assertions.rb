require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class KindTest < MiniTest::Test
  def setup
    @int     = 3
    @fix_num = 5
    @flo     = 5.318008
    @com     = (1 + 3i)
    @rat     = (2 / 3)
    @big_num = 1111111111111111111111111111
    @big_dec = 3.00
  end

  def test_kind_of
    assert_kind_of Numeric, @int
    assert_kind_of Numeric, @fix_num # deprecated
    assert_kind_of Numeric, @flo # also Float
    assert_kind_of Numeric, @com # also Complex
    assert_kind_of Numeric, @rat
    assert_kind_of Numeric, @big_num
    assert_kind_of Numeric, @big_dec

    # assert_instance_of Integer, @int
    # assert_equal true, @flo.instance_of?(Float)
  end
end
