class PerfectNumber
  def self.classify(n)
    raise StandardError if n < 1

    @@n = n
    result = 0

    for i in 1..(n/2) do
      result += i if (n % i).zero?
    end
    classifier(result)
  end

  def classifier(x)
    case x <=> @@n
    when  1 then "abundant"
    when  0 then "perfect"
    when -1 then "deficient"
    end
  end
end
