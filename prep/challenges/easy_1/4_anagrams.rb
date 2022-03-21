=begin
  sort target candidate

  traverse list;
    compare candidates;
  list ->
=end

class Anagram
  def initialize(target)
    @target = target.downcase
  end

  def match(list)
    list.select do |candidate|
      candidate = candidate.downcase
      @target != candidate && sorted(@target) == sorted(candidate)
    end
  end

  private

  def sorted(s)
    s.chars.sort
  end
end

=begin
  traverse list;
    dowcase each candidate that is evaluated
    select the curr candidate if it isn't the same as the candidate
      and has the same letters
  return
=end