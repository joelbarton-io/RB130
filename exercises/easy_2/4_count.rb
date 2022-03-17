class Answer
  # def r_count(*args)
  #   truths = 0
  #   args.each do |element|
  #     truths += 1 if yield(element)
  #   end
  #   truths
  # end
  # recursive
  def count(*args, &block)
    return 0 if args.empty?
    total = if block.call(args.shift)
              1
            else
              0
            end
    total + count(*args, &block)
  end
end
ans = Answer.new

p ans.count(1, 3, 6) { |value| value.odd? } == 2
p ans.count(1, 3, 6) { |value| value.even? } == 1
p ans.count(1, 3, 6) { |value| value > 6 } == 0
p ans.count(1, 3, 6) { |value| true } == 3
p ans.count() { |value| true } == 0
p ans.count(1, 3, 6) { |value| value - 6 } == 3
