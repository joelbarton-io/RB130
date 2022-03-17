require 'minitest/autorun'

class BooleanTest < MiniTest::Test
  def test_odd?
    value = 1
    assert_equal(true, value.odd?)
  end
end

assert_equal(true, value.odd?)
# or
assert value.odd?, 'value is'
