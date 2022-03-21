=begin
  equilateral: all sides same length
  isocolese: two sides asme length
  scalene: all sides different length

  additionally

  all sides must have a length > 0
  sum of any two sides must be greater than the last side
=end

class Triangle
  MESSAGE1 = "all sides must be greater than 0"
  MESSAGE2 = "the sum of any two sides must be greater than the last side"
  def initialize(length, height, width)
    @sides = [length, height, width]
    raise ArgumentError.new(MESSAGE1) if @sides.any? { |side| side <= 0 }
    raise ArgumentError.new(MESSAGE2) if one_greater_than_two?()
  end

  def kind
    case @sides.uniq.size
    when 1 then "equilateral"
    when 2 then "isosceles"
    when 3 then "scalene"
    end
  end

  def one_greater_than_two?
    3.times do
      return true if @sides.first(2).sum <= @sides.last(1).sum
      @sides.unshift(@sides.pop)
    end
    false
  end
end

# Pedac was bad(underdeveloped); spend a lot of time doing the constructor function; ended up being wrong
# 35 ish minutes
