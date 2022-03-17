=begin
i: array, block
o: array

DOCS:
Drops elements up to, but not including, the first element for which the
block returns nil or false and returns an array containing the remaining elements.

=end

class Answer
  def drop_while(array)
    idx = 0
    while idx < array.size && yield(array[idx])
      idx += 1
    end
    array.slice(idx..)
    # as soon as the yield is `nil` or false, slice from current
  end
end

ans = Answer.new

p ans.drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p ans.drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p ans.drop_while([1, 3, 5, 6]) { |value| true } == []
p ans.drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p ans.drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p ans.drop_while([]) { |value| true } == []
