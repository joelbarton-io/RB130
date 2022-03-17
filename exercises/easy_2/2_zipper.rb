=begin

=end

class Answer
  def zip(left, right)
    raise ArgumentError.new("Arrays must be the same size!") if left.size != right.size
    Array.new(left.size).map do |_|
      [] << left.shift << right.shift
    end
  end
end

p Answer.new.zip([1, 2, 3], [4, 5, 6, 7]) #== [[1, 4], [2, 5], [3, 6]]
