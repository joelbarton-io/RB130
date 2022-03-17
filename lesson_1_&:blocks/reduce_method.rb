=begin
goal: fold or accumulate a collection into 1 object
optional arg: default value
=end
def reduce(array, default = array.first)
  acc = default
  count = 1
  while count < array.size
    acc = yield(acc, array[count])
    count += 1
  end
  acc
end

# array = [1, 2, 3, 4, 5]
# p reduce(array) { |acc, num| acc + num }             # => 15
# p reduce(array, 10) { |acc, num| acc + num }         # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc + value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
