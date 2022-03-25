=begin
str_of_digits -> arr_of_sub_string_as_digit

'taking a string of digits' slicing them up by length n'

implicit req:
  if n > str.length -> argumentError!
  returns array of arrays
  string values msut be represented as digits in array
  # of subarrs == str.length - (n - 1)

ds: str -> arr_slice -> arr_digit_slice -> full_array

algo:

takes in a string
slices takes arg n (slice length)

CONVERT str -> arr of chrs
declare empty array result

TRAVERSE arr with index
  slice at idx, n

map all array elements to digits
return
=end

class Series
  def initialize(str); @str = str; end

  def slices(n) # => [ [], [], ... ]
    raise ArgumentError if n > @str.length
    arr = @str.chars
    iterations = @str.length - (n - 1)

    result = []
    iterations.times do |start_idx|
      result << arr.slice(start_idx, n).map(&:to_i)
    end
    result
  end
end

# 20 minutes all said.
