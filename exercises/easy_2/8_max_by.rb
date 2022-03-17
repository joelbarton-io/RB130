=begin
TRAVERSE

=end

class Answer
  # def max_by(arr)
  #   return nil if arr.empty?
  #   new_arr = arr.each_with_object([]) do |el, obj|
  #     obj << yield(el)
  #   end
  #   arr.fetch(new_arr.index(new_arr.max))
  # end

  def max_by(arr)
    return nil if arr.empty?
    curr_max = arr.first
    arr[1..].each do |candidate|
      curr_max = candidate if yield(curr_max) < yield(candidate)
    end
    curr_max
  end
end

ans = Answer.new

p ans.max_by([1, 5, 3]) { |value| value + 2 } == 5
p ans.max_by([1, 5, 3]) { |value| 9 - value } == 1
p ans.max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p ans.max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p ans.max_by([-7]) { |value| value * 3 } == -7
p ans.max_by([]) { |value| value + 5 } == nil
