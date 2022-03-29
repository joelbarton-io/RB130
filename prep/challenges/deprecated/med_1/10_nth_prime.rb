=begin

calculate all prime numbers up to and including `n`?
or...
something else

=end

class Prime
  def self.nth(n)
    raise ArgumentError if n.zero?
    prime_count = 0
    number = 1
    until prime_count == n
      number += 1
      prime_count += 1 if prime?(number)
    end
    number
  end

  def self.prime?(number)
    (2..(number / 2)).none? { |div| number % div == 0 }
  end
end

# big_prime took: 0:00:13, seive of eratosthenese would probably speed things up
