# " A \nB B\n A \n"  => '_A_->B_B->_A_->'

=begin
5 letters =>
          4_{l}4_
          3_{l}1_{l}3_
          2_{l}3_{l}2_
          1_{l}5_{l}1_
start---->0_{l}7_{l}0_

dimension = (letter index * 2) - 1

outer space count = 0
inner space count = dimension - 2


* at the end, add a new line to every element in the halfing excluding_Aay, then join
=end

class Diamond
  ALPHA = ('A'..'Z').to_a
  SPACE = " "

  def self.make_diamond(letter)
    return "A\n" if letter == "A"
    dimension = find_dimensions(letter)
    make_full(make_partial_half(dimension), make_first((dimension - 1) / 2))
  end

  def self.make_first(count)
    (SPACE * count) + ALPHA.first + (SPACE * count)
  end

  def self.make_partial_half(dimension)
    spaces = dimension - 2
    excluding_A = ALPHA.slice(1, dimension / 2).reverse
    half = []
    excluding_A.each.with_index do |chr, idx|
      half << (SPACE * idx).concat(chr, SPACE * spaces, chr, SPACE * idx)
      spaces -= 2
    end
    half
  end

  def self.find_dimensions(letter)
    (ALPHA.index(letter) * 2) + 1
  end

  def self.make_full(half, first_line)
    half.unshift(half.slice(1..).reverse)
      .flatten
      .unshift(first_line)
      .push(first_line)
      .map { |line| line + "\n"}
      .join
  end
end
