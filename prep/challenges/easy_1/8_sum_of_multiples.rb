=begin

check numbers upto but not including n
check if a number in list is multiple of 3 or 5

=end

class SumOfMultiples
  def initialize(*divisors)
    @divisors = divisors
  end

  def to(n, multiples = [])
    1.upto(n-1) do |candi|
      multiples << candi if @divisors.any? { |el| candi % el == 0 }
    end
    multiples.sum
  end

  def self.to(n)
    new(3, 5).to(n)
  end
end

# p SumOfMultiples.to(20)

# under 15; felt solid, had to go back and revise some bad code.