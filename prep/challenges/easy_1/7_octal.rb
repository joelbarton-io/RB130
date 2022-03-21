=begin
233 # octal

= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155


i: octal number
o: integer

create array of sums (as string values)
  traverse @n as array of indexes
    "el to int * (8 ** index)" -> push this to new array


join, reverse, integerize, sum the elements
=end

class Octal
  def initialize(n)
    @n = n.chars
  end

  def to_decimal
    return 0 if ( @n.size == 1 && @n[0] != '1' ) || !valid?(@n)
    vals = []
    @n.reverse_each.with_index do |el, pwr|
      vals << el.to_i * (8 ** pwr)
    end
    vals.sum
  end

  private

  def valid?(arr)
    arr.all? { |el| el =~ /[0-7]/ }
  end
end

# 35 - 40 minutes...