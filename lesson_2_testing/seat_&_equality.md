# seat
- [S]etup necessary objs to use in tests
- [E]xecute code with ^
- [A]ssert results of exe
- [T]ear down & cleanup lingering artifacts

- ...is an approach to writing tests
- we store an instance of an object in an `@i-var`; thus it is accessible in all our test (instance) methods;

# testing equality
- `assert_equal` : tests for *value equality*
- `assert_same` : tests for *object equality*

- on Ruby core library classes, we can get away with the respective `==` instance methods for each class, but for...
- custom classes
  - minitest will tell us we ought to implement a custom `==`
```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other) # assert_equal would fail without this method
    other.is_a?(Car) && name == other.name
  end
end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2) # this will pass as it uses Car#==; eql based on class?
    assert_same(car1, car2)  # this will fail as it uses BasicObject#==; same obj?
  end
end
```
