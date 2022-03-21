class Clock
  def initialize(h, m)
    @h = h
    @m = m
  end

  def self.at(h, m = 0)
    Clock.new(h, m)
  end

  def +(number)
    h, m = make_hr_min(number)
    start_process(h, m, :+)
  end

  def -(number)
    h, m = make_hr_min(number)
    start_process(h, m, :-)
  end

  def to_s
    ("%02d" % @h) + ":" + ("%02d" % @m)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def start_process(hours, minutes, operation)
    case operation
    when :- then subtraction(hours, minutes)
    when :+ then addition(hours, minutes)
    end
  end

  def addition(hours, minutes)
    @m += minutes
    until @m < 60 do
      hours += 1
      minutes -= 60
    end

    @h += hours
    until @h < 24 do
      @h -= 24
    end
    self
  end

  def subtraction(hours, minutes)
    @h -= hours
    @m -= minutes
    until @m >= 0 do
      @h -= 1
      @m += 60
    end

    until @h >= 0
      @h += 24
    end
    self
  end

  def make_hr_min(raw_minutes)
    hr = 0
    until raw_minutes < 60 do
      raw_minutes -= 60
      hr += 1
    end
    [hr, raw_minutes]
  end
end