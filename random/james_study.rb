# require 'minitest/autorun'
# # Write a minitest assertion that will fail if the value.odd? is not true.
# UseLotionError = Class.new(StandardError)

# class Barbarian
#   attr_reader :value, :name, :hitpoints, :clan

#   def initialize(value, name, hitpoints, clan)
#     @value = value
#     @name = name
#     @hit_points = hitpoints
#     @clan = clan
#   end

#   def ==(other)
#     clan == other.clan
#   end

#   def use_lotion
#     wrong_behavior
#     #...
#   end

#   def wrong_behavior
#     raise UseLotionError, 'Barbarians dont use lotion!'
#   end
# end

# class BarbarianTest < MiniTest::Test
#   def setup
#     @barb = Barbarian.new(1, 'charlie', 100, 'Northern')
#     @deni = Barbarian.new(1, 'denise', 50, 'Northern')
#   end

#   def test_odd
#     skip
#     # assert_equal(expected, actual)
#     assert(@barb.value.odd?, 'it is odd!')
#   end

# 	def test_clan_equals_nil
#     skip
# 		assert_nil(@barb.clan) # not nil!
# 	end

#   def test_clan_equals_nil_with_equal
#     skip
# 		assert_equal(nil, @barb.clan) # not nil!
#   end

# 	def test_same_class
# 		skip
# 		# assert_same(@barb, @deni) # equal?
#     # assert_equal(@barb, @deni) # == is overriden by Barbarian#==
#     assert(@barb == @deni) # expression returns true? -> passes
# 	end

#   def test_respond_to_clan_getter # :clan getter
#     skip
#     # assert_equal('southern', @barb.clan) # true == 'Northern'
#     assert_respond_to(@barb, :clan=)
#   # assert_equal(expected_value, return_value_of_expression) # true == 'Northern'
#   end

# 	def test_instance_of_barbarian?
#     skip
# 		assert(@deni.instance_of?(Barbarian))

#     # assert_instance_of(Barbarian, @deni)
# 	end

#   def test_kind_of
#     skip
#     assert(@deni.class.kind_of?(Object)) # [Barbarian, Object...]
#     assert_kind_of(Object, Barbarian) # yes
#   end

#   def test_raises_NoMethodError_exception # passes!
#     assert_raises(UseLotionError) do
# 			# call method on object; raise no method error
#       @deni.use_lotion
# 		end
#   end
# end

# p Barbarian.new(1, 'denise', 50, 'Northern').use_lotion



=begin
I get that Machine inherits puts from Kernel, however we can't actually invoke puts upon any instances of Machine.  I think this is where some of the confusion is coming from. I've added one instance method: fake_puts to the original code which invokes to_s upon the calling object.
=end

class Machine
  def start
    flip_switch(:on)
  end

  def puts # public instance method
    p to_s
  end

  private

  def to_s
    "#{switch}"
  end

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

car = Machine.new
car.start
car.puts # invoking public instance method `fake_puts` upon `car`
puts car
# puts car
