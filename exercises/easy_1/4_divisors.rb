=begin
i: integer; o: array of divisors

ds: int -> range obj -> |iteration| -> return list

algo:

generate range
  check if input is divisible by current
  next if it isn't
  if it is, push current to an array

return array
=end
class Answer
  def divisors(num)
    @num = num
    t1 = Time.now
    ans = (1..(@num / 2)).select { |divisor| (@num % divisor).zero? } << @num
    t2 = Time.now
    puts t2 - t1
    ans
  end
end

instance = Answer.new

# p instance.divisors(1) == [1] # true
# p instance.divisors(7) == [1, 7] # true
# p instance.divisors(12) == [1, 2, 3, 4, 6, 12] # true
# p instance.divisors(98) == [1, 2, 7, 14, 49, 98] # true
p instance.divisors(99400891) == [1, 9967, 9973, 99400891] # true
