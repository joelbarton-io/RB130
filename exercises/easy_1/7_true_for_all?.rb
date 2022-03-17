require 'set'

class Answer
  def all?(collection)
    collection.each do |element|
      return false unless yield(element)
    end
    true
  end
end

ans = Answer.new
p ans.all?([1, 3, 5, 6], &:odd?) == false
p ans.all?({ a: 1, b: 3, c: 5, d: 6 }) { |_, value| value.even? } == false
p ans.all?(Set.new([1, 3, 5, 6])) { |value| value.instance_of? Integer } == true

# p ans.all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p ans.all?([2, 4, 6, 8]) { |value| value.even? } == true
# p ans.all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p ans.all?([1, 3, 5, 7]) { |value| true } == true
# p ans.all?([1, 3, 5, 7]) { |value| false } == false
# p ans.all?([]) { |value| false } == true
