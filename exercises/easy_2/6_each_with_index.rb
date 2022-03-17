=begin
- passes el + idx to assoc &[]
- value returned by the block is not used!
- e w/ idx returns reference to original coll
- takes coll and block as args
- yields each el + idx to block

i: coll + block
o: original collection

yields el + idx to block (we don't care about return value of block)

ds: coll -> coll ref

algo:

TRAVERSE collection
  YIELD el + idx to block
  EXECUTE block
  NEXT el
END
RETURN og coll
=end

class Answer
  # def each_with_index(coll)
  #   idx = 0
  #   until idx == coll.size
  #     yield(coll[idx], idx)
  #     idx += 1
  #   end
  #   coll
  # end

  # def each_with_index(coll)
  #   idx = 0
  #   for i in coll
  #     yield(i, idx)
  #     idx += 1
  #   end
  #   coll
  # end

  # do this with reduce/inject?
end

# ans = Answer.new

# result = ans.each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]
