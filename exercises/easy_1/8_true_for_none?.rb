class Answer
  def none?(collection)
    collection.each do |element|
      return false if yield(element)
    end
    true
  end
end
ans = Answer.new
p ans.none?([1, 3, 5, 6]) { |value| value.even? } == false
p ans.none?([1, 3, 5, 7]) { |value| value.even? } == true
p ans.none?([2, 4, 6, 8]) { |value| value.odd? } == true
p ans.none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p ans.none?([1, 3, 5, 7]) { |value| true } == false
p ans.none?([1, 3, 5, 7]) { |value| false } == true
p ans.none?([]) { |value| true } == true
