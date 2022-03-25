=begin

ignore non-letter chars
split by punctuation (,)
case-insensitive


clean string input; place in array
tally up the words in the clean words array
return that hash object


# p "car : carpet as java : java'script!!&@$%^&".scan(/\b[\w']+\b/).map(&:downcase).reject(&:empty?).tally
=end

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.scan(/\b[\w']+\b/)
           .map(&:downcase)
           .reject(&:empty?).tally
  end
end

# 35 minutes, kinda cheated
