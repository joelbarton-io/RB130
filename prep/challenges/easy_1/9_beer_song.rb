class BeerSong
  def self.verse(arg)
    sing(arg)
  end

  def self.verses(*args)
    str = ''
    (args.first).downto(args.last) do |num|
      str << sing(num)
      str << "\n" unless args.last == num
    end
    str
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def sing(n)
      case n
      when 2 then "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
        "Take one down and pass it around, #{n - 1} bottle of beer on the wall.\n"
      when 1 then "#{n} bottle of beer on the wall, #{n} bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 0 then "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      else
        "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
        "Take one down and pass it around, #{n - 1} bottles of beer on the wall.\n"
      end
    end
  end
end
