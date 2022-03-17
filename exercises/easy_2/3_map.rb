require 'set'
=begin
takes an array as arg
takes block as arg
returns new array
if empty arr, returns new empty arr
=end

class Answer
  def map(coll)
    obj_type = coll.class
    to_build = obj_type.new
    result = coll.each_with_object(to_build) do |el, new_coll|
      if obj_type.instance_of? Hash

      new_coll << yield(el)
    end
    p result.to_a
  end
end

ans = Answer.new
# p ans.map([1, 3, 6])
# p ans.map([]) == []
# p ans.map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p ans.map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p ans.map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

set = Set.new([1, 3, 6])
hsh = Hash.new({ a: 1, b: 3, c: 6 })
p ans.map(set) { |value| value**2 } == [1, 9, 36]
p ans.map(hsh) { |value| value**2 } == { a: 1, b: 9, c: 36 }
