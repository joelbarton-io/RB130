class Answer
  def count(collection)
    collection.select do |element|
      element if yield(element)
    end.size
  end

  def count_recursive(collection, &block)
    return 0 if collection.empty?
    count = if yield(collection.shift)
              1
            else
              0
            end
    count + count_recursive(collection, &block)
  end
end

ans = Answer.new
p ans.count_recursive([1, 2, 3, 4, 5]) { |value| value.odd? } == 3
p ans.count_recursive([1, 2, 3, 4, 5]) { |value| value % 3 == 1 } == 2
p ans.count_recursive([1, 2, 3, 4, 5]) { |value| true } == 5
p ans.count_recursive([1, 2, 3, 4, 5]) { |value| false } == 0
p ans.count_recursive([]) { |value| value.even? } == 0
p ans.count_recursive(%w(Four score and seven)) { |value| value.size == 5 } == 2
