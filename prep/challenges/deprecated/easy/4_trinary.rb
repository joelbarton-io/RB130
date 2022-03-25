=begin

starting at end;
el * 3 ** curr_idx

=end

class Trinary
  def initialize(str_dig)
    @arr = str_dig.chars.reverse
  end

  def to_decimal
    return 0 if @arr.any? { |el| el.match?(/[a-z]/i) }
    @arr.map.with_index { |el, idx| el.to_i * 3**idx }.sum
  end
end
p Trinary.new('0a1b2c').to_decimal

# ~ 14 minutes
