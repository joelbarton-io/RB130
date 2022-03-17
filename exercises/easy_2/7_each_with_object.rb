=begin
passes each coll element and an object to assoc block
return value from block not used
obj that is passed to block is defined as an arg in each w/ obj

i: arr, arb obj
o: arb obj

TRAVERSE arr
  YIELD el and obj to block
END

RETURN obj
=end

class Answer
  # def each_with_object(arr, obj)
  #   arr.each { |el| yield(el, obj) }
  #   obj
  # end

  # def each_with_object(arr, obj)
  #   idx = 0
  #   while idx < arr.size
  #     yield(arr[idx], obj)
  #     idx += 1
  #   end
  #   obj
  # end

  # def each_with_object(arr, obj)
  #   idx = 0
  #   until idx == arr.size
  #     yield(arr[idx], obj)
  #     idx += 1
  #   end
  #   obj
  # end

  def each_with_object(arr, obj)
    arr.inject(obj) do |memo, elem|
      yield(elem, memo)
      obj
    end
  end
end

ans = Answer.new

result = ans.each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = ans.each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = ans.each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = ans.each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}

[].inject