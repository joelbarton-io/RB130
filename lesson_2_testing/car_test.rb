# assert style syntax
require 'minitest/autorun' # loads all necessary files from gem
require "minitest/reporters" # requires reporters
Minitest::Reporters.use! # tells minitest to use reporters

require_relative 'car' # require file to test; 'relative': same directory self

class CarTest < MiniTest::Test
  def test_wheels # prefixing 'test_' tells Minitest this is a test
    car = Car.new # instantiate object to use in test
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip("skipped test_bad_wheels!") # can pass on a message!
    car = Car.new
    assert_equal(2, car.wheels) # (expected, actual) # Fails!
  end
end
