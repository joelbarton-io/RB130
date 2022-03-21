=begin
  traverse word as characters
  pass each letter to evaluator

=end

class Scrabble
  SCORES = {
    1 => /[aeioulnrst]/i,
    2 => /[dg]/i,
    3 => /[bcmp]/i,
    4 => /[fhvwy]/i,
    5 => /[k]/i,
    8 => /[jx]/i,
    10 => /[qz]/i
  }

  def initialize(text)
    @text = text
  end

  def self.score(text)
    Scrabble.new(text).score
  end

  def score
    return 0 if @text.nil? || @text.size == 0

    word_value = 0
    @text.chars.each do |l|
      SCORES.each do |k, v|
        word_value += k if v.match?(l)
      end
    end
    word_value
  end
end

# p Scrabble::SCORES[1].match?('a')

p Scrabble.new('CABBAGE').score

# 15 minutes to finishing; was pretty easy
