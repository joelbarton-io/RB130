=begin
decimal number // binary string -> array of string values

1 = wink
10 = double blink
100 = close your eyes
1000 = jump

10000 = Reverse the order of the operations in the secret handshake.
if the binary string is of a length greater than 5, reverse the array

ds: hash with numbers as keys, strings as values

algo:
  if binary string contains non numeric chrs, return empty array

  call to_s(2) if input is an integer

  create a list of integer values (if curr el is 1) -> 1* (idx + 1)

  construct our array of phrases -> reverse it back

  if binary string was of length 5 or more, reverse it back
=end

class SecretHandshake
  CIPHER = {
    1 => "wink",
    10 => "double blink",
    100 => "close your eyes",
    1000 => "jump"
  }

  def initialize(input)
    @bin_string = input.instance_of?(Integer) ? input.to_s(2) : input
  end

  def commands
    code = []
    return code if @bin_string.match?(/[a-z]/i)
    @bin_string
      .chars
      .reverse
      .each_with_index do |chr, idx|
        code << (chr.to_i * 10)**idx if chr == '1'
      end
    interpret(code)
  end

  private
  
  def interpret(array)
    result = array.each_with_object([]) do |code_word_as_bin, res|
      res << CIPHER[code_word_as_bin] unless code_word_as_bin == 10000
    end
    should_reverse? ? result.reverse : result
  end

  def should_reverse?
    @bin_string.length > 4
  end
end

# 33 minutes first pass w/ test cases and rubocop
SecretHandshake.new(19).commands
