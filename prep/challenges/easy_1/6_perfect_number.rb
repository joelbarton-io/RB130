=begin

abundant: aliquot sum > num

perfect : aliquot sum == num

deficient : aliquot sum < num


get all divisors that can be evenly divided into num

  - iterate from 1-(n-1)
    add all nums that evenly divide to an array

sum divisors, go from there
  sum this array;
=end

class PerfectNumber
  def self.classify(n)
    raise StandardError.new if n < 2
    divisors = []
    1.upto(n-1) do |candidate|
      divisors << candidate if n % candidate == 0
    end

    case divisors.sum <=> n
    when  1 then "abundant"
    when  0 then "perfect"
    when -1 then "deficient"
    end
  end
end

# under 10; passed first go.  However, my solution is really inefficent.