=begin


I -> 1
V -> 5
X -> 10
L -> 50
C -> 100
D -> 500
M -> 1000


i => int   o => str


=end
   # I => 1, V => 5, X => 10, L => 50, C => 100, D => 500, M => 1000

class RomanNumeral
  NUMERALS = {
    1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I'

  }
  def initialize(num)
    @num = num
  end

  def to_roman
    zeros_count = @num.digits.reverse.length - 1
    numbers_arr = []
    @num.digits.reverse.each do |dig|
      dig == 0 ? nil : numbers_arr << (dig * 10 ** zeros_count)
      zeros_count -= 1
    end

    numeral_representation = ''
    numbers_arr.each do |num|
      if NUMERALS.keys.include?(num)
        numeral_representation << NUMERALS[num]
      else
        num < 1000 && num > 500
        num # stopped at 42 minutes
      end

    end
    numeral_representation

  end
end

test_ = RomanNumeral.new(1990)
p test_.to_roman
# 1990

# Skip first bc it's 0
# second