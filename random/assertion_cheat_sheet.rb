require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class AssertionsTest < Minitest::Test
  def test_assertions
    # The subjects (values being tested)
    singer = 'Michael Buble'
    calculation = 0.3 - 0.2 # = 0.09999999999999998

    # The most basic assertion
    assert singer.end_with?('e')

    # Equality/matching
    assert_equal 'Michael', singer.split.first # expected == actual
    assert_same singer, singer # expected.equal?(actual)
    assert_nil nil
    assert_match /Michael (Buble|Jackson)/, singer # regex =~ singer

    # Containers
    assert_empty "" # obj.empty?
    assert_includes singer, 'Bub' # singer.include?('Bub')

    # Numeric
    assert_in_delta 0.1, calculation    # float comparison (absolute error method)
    assert_in_epsilon 0.1, calculation  # float comparison (relative error method)
    assert_operator calculation, :<, 5  # calculation < 5

    # Types/messages
    assert_instance_of Float, calculation  # calculation.instance_of?(Float)
    assert_kind_of Numeric, calculation    # calculation.kind_of?(Numeric)
    assert_respond_to singer, :downcase    # singer.respond_to?(:downcase)

    # Generic
    assert_predicate calculation, :positive?   # calculation.positive?
    assert_send [singer, :start_with?, 'Mic']  # singer.start_with?('Mic')

    # Exceptions
    error = assert_raises(ZeroDivisionError) { 5 / 0 }
    assert_equal error.message, 'divided by 0'

    # Output
    assert_output("0.09999999999999998\n") { puts calculation }
    assert_silent { "nothing output to $stdout or $stderr" }

    # Refute (opposite of assert)
    refute singer.end_with?('Jackson')
    refute_empty singer
    refute_equal singer, 'Lady Gaga'
    refute_in_delta calculation, 3.14
    refute_in_epsilon calculation, 3.14
    refute_includes singer, 'z'
    refute_instance_of Numeric, calculation
    refute_kind_of Integer, calculation
    refute_match /Gaga/, singer
    refute_nil singer
    refute_operator calculation, :>, 3.14
    refute_predicate singer, :empty?
    refute_respond_to singer, :sing
    refute_same singer, 'Michael Buble'
  end
end
# def for_each_in(arr)
#   arr.each { |element| yield element }
# end

# arr = [1, 2, 3, 4, 5]
# results = [0]

# for_each_in(arr) do |number|
#   total = results[-1] + number
#   results.push(total)
#   puts results[-1]
# end

# p results # => [0, 1, 3, 6, 10, 15]

# selfish_proc = Proc.new { p self }

# selfish_proc.call # main

# def proc_caller(proc) # method defined
#   proc.call
# end

# name = 'whatever' # `name` initialized

# a_proc = Proc.new { p name } # proc created
# name = 'something else' # `name` reassigned
# proc_caller(a_proc) # Proc object passed; carries context

#-------------------------------------------------------
# def method_a # implicit
#   yield(3)
#   # block.call(3)
# end

# method_a { |num| puts num**3 }

# def method_b(&block) # converts block to simple Proc
#   # yield(3)
#   block.call(3)
# end

# method_a { |num| puts num**3 }
# method_b { |num| puts num**3 }
#-------------------------------------------------------

# def a_method(param, param2)
#   block_given?
#   # yield(param, param2)
#   # puts param, param2
# end

# p a_method('hi', 'bye') { |a| puts "args: #{a}" }

# ARRAY = [1, 2, 3]

# def abc
#   a = 3
# end

# def xyz(collection)
#   collection.map { |x| yield x }
# end

# proc = Proc.new { }

# p proc.binding
# # xyz(ARRAY) do
# #   # block body
# # end

