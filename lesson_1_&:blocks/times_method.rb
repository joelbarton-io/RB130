=begin
first arg is always 0
last arg is always one less than calling object
returns calling object
=end

# initial attempt

# def times(iterations)
#   (0...iterations).each do |num|
#     yield(num)
#   end
#   iterations
# end

# p times(5) { |el| puts el }

# ls way
def times(num)
  if block_given?
    count = 0
    while count < num do
      yield(count)
      count += 1
    end
  end
  num
end

p times(5) { |el| puts el } # invoked with block
p times(5) #{ |el| puts el } # invoked w/o block
# 'execution enters...'
# 'yields execution to...'
# 'passing argument to block...'
