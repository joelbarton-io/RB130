=begin
"Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar", "Nyna Ghevat", "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv", "Wbua Ngnanfbss", "Ybvf Unvog", "Pynhqr Funaaba", "Fgrir Wbof", "Ovyy Tngrf", "Gvz Orearef-Yrr", "Fgrir Jbmavnx", "Xbaenq Mhfr", "Fve Nagbal Ubner", "Zneiva Zvafxl", "Lhxvuveb Zngfhzbgb", "Unllvz Fybavzfxv", "Tregehqr Oynapu"

-------------------
letters are moved 13 to the right -> (+)

i: array
o: array of decrypted names

ds: array -> |iterate| -> yield each to decryption block

algo:

if index of letter is
=end

class Answer
  ALPHABET = ('a'..'z').to_a
  SIZE = 26

  def initialize(list)
    @names = list
    @alphabet = ALPHABET
  end

  def decipher
    self.names = map(&:downcase).to_a
    self.names = map do |name|
      decrypted = decrypt(name)
      decrypted.split.map(&:capitalize).join(" ")
    end.to_a
    self
  end

  protected

  def to_a
    names
  end

  private

  attr_accessor :names

  def to_s
    "#{names}"
  end

  def decrypt(name)
    name.chars.map do |letter|
      new_letter = nil
      if ALPHABET.include?(letter)
        idx = ALPHABET.index(letter) + 13
        new_letter = idx >= SIZE ? ALPHABET[idx - SIZE] : ALPHABET[idx]
      else
        new_letter = letter
      end
      new_letter
    end.join
  end

  def map
    n = names.map do |name|
      yield(name) if block_given?
    end
    Answer.new(n)
  end
end

names = ["Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar", "Nyna Ghevat", "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv", "Wbua Ngnanfbss", "Ybvf Unvog", "Pynhqr Funaaba", "Fgrir Wbof", "Ovyy Tngrf", "Gvz Orearef-Yrr", "Fgrir Jbmavnx", "Xbaenq Mhfr", "Fve Nagbal Ubner", "Zneiva Zvafxl", "Lhxvuveb Zngfhzbgb", "Unllvz Fybavzfxv", "Tregehqr Oynapu"]
pioneers = Answer.new(names)
puts pioneers.decipher
