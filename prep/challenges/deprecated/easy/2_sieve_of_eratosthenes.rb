=begin
take the next available unmarked number in your list (it is prime)
mark all the multiples of that number (they are not prime)

=end

class Sieve
  def initialize(n)
    @n = n
    @booleans = Array.new(n, true)
  end

  def primes
    tmp = Math.sqrt(@n).to_i

    (2..tmp).each do |i|
      if @booleans[i]
        (i**2...@n).step(i) { |j| @booleans[j] = false }
      end
    end

    nums = []
    @booleans.each.with_index { |el, idx| nums << idx if el }
    nums[2..]
  end
end
