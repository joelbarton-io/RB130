def each(arg, count = 0) # focused solely on iterating through array
  arg = arg.to_a unless arg.instance_of? Array
  while count < arg.size do
    yield(arg[count]) # yields to block; passes element as arg
    count += 1
  end
  arg
end

# p each([1, 2, 3]) {|el| puts el }
# p each([3, 2, 1]) { |el| p el.odd? }
# p each(%w(hi hey howareyanow?)) { |greeting| puts greeting.upcase }
# p each((1..3)) { |num| puts num += 1 }
p each({a: 'a', b: 'b', c: 'c'}) { |arr| puts arr }
