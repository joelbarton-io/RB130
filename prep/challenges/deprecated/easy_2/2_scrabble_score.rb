=begin
compute the composite score of a word (string of letters)

Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

implicit
  -> letters can count twice (if there are dups)
  -> case-insensitive
  -> should catch non-string inputs and return 0
  -> empty string is 0
  -> non-word characters are 0 (dismissed)

str -> integer

str -> array of lowercase chars -> |iteration| -> result number

Pass-in string; downcase it
Remove all non-word characters: (/[a-z]/)
Convert to array of characters

Init result value at 0
Traverse array, passing each char to block
  Increment result value based on LETTERVALUES hash

Return value
=end

class Scrabble
  LETTERVALUES = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z)
  }
  def initialize(text)
    @text = text
  end

  def score
    return 0 if @text.nil?
    arr = @text.downcase.gsub(/[^a-z]/, '').chars
    result = 0
    arr.each do |chr|
      num = 0
      LETTERVALUES.each { |k, v| num = k if v.include? chr }
      result += num
    end
    result
  end

  def self.score(text)
    new(text).score
  end
end

# 22 minutes; sort of clunky in the middle
