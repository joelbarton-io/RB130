food = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(food) do |*foods, single|
#   puts foods.join(', ')
#   puts single
# end

# gather(food) do |one, *two, three|
#   puts one
#   puts two.join(', ')
#   puts three
# end

# gather(food) do |first, *others|
#   puts first
#   puts others.join(', ')
# end

# gather(food) do |apples, corn, cabbage, wheat|
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
# end