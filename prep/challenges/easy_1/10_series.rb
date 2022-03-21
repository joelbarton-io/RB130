=begin
  given length N and a string;
  return (string.length - (n - 1)) arrays of length n

  traverse (0...array_count)
    result array << slice (curr idx, n)

=end

class Series
  def initialize(str)
    @arr = str.chars
  end

  attr_reader :arr
  private :arr

  def slices(n)
    raise ArgumentError.new if arr.size < n
    (0..arr.size - n).each.with_object([]) do |idx, result|
      result << arr[idx, n].map(&:to_i)
    end
  end
end
