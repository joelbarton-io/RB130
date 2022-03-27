=begin
Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.
For any digits that thus become 10 or more, subtract 9 from the result.
  1111 becomes 2121.
  8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).

checksum is just all digits added together
  1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6.
  8763 becomes 7733, and 7+7+3+3 is 20.

sum of numbers must end in zero

=end

class Luhn
  def initialize(num)
    @num = num
  end

  def addends
    @num.digits.map.with_index do |n, idx|
      if idx.odd?
        n *= 2
        n > 9 ? n -= 9 : n
      end
      n
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum.digits.first.zero?
  end

  def self.create(number)
    n = number * 10
    new(n).valid? ? n : n + (10 - (new(n).checksum % 10))
  end
end

# 45 minutes to finish
 