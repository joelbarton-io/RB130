class Answer
  def one?(collection)
    truths = []
    collection.each do |element|
      ans = yield(element)
      truths << ans if ans
      return false if truths.size > 1
    end
    truths.size == 1
  end
end

ans = Answer.new
p ans.one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p ans.one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p ans.one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p ans.one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p ans.one?([1, 3, 5, 7]) { |value| true }           # -> false
p ans.one?([1, 3, 5, 7]) { |value| false }          # -> false
p ans.one?([]) { |value| true }                     # -> false