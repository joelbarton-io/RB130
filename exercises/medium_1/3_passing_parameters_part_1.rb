items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items, &block) # converts block to simple proc obj
  puts "Let's start gathering food."
  block.call(items) # invokes `call` upon proc obj
  puts "Nice selection of food we have gathered!"
end

proc_1 = proc { |item| puts "#{items.join(', ')}" }

gather(items, &proc_1) # converts proc obj to block
