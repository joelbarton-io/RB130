require 'set'

class Answer
  def any?(arr)
    arr.each do |element|
      return true if yield(element)
    end
    false
  end
end

instance = Answer.new
# calling `Answer#any?` upon `instance`
# p instance.any?([1, 3, 5, 6]) { |value| value.even? } == true
# p instance.any?([1, 3, 5, 7]) { |value| value.even? } == false
# p instance.any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p instance.any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p instance.any?([1, 3, 5, 7]) { |value| true } == true
# p instance.any?([1, 3, 5, 7]) { |value| false } == false
# p instance.any?([]) { |value| true } == false

p instance.any?({ a: 1, b: 3, c: 5, d: 6 }) { |_, value| value.even? } == true
