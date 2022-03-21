=begin

i: two strings
o: integer

checks if two strings are the same length; yes? standard op
  no? -> slice
=end



class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    length_to_ham = [@strand.size, distance.size].min
    count = 0

    (0...length_to_ham).each do |idx|
      count += 1 if @strand[idx] != distance[idx]
    end
    count
  end
end
# 15 minutes; coding was trivial
