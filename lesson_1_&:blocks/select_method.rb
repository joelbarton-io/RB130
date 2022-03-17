=begin

takes block
yields(each element)
if block evals true, add element
else, dont include it in returned array
=end

def select(array, count = 0, new_arr = [])

  while count < array.size do
    result = yield(array[count])
    if !!result
      new_arr << array[count]
    end
    count += 1
  end
  new_arr
end

# p select([1, 2, 3]) { |el| el.is_a? Integer }
# p select(['a', 'as', 'asd','asdf']) { |el| el.size > 3 }
# p select([{}, ['q'], ['rasdf'], 3, Integer]) { |el| el.is_a? Array }
