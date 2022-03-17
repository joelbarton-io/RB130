class Answer
  def step(beg, fin, dif)
    while beg <= fin
      yield(beg)
      beg += dif
    end
    (beg..fin) # never said we couldn't return a range!
  end
end

Answer.new.step(1, -10, 3) { |n| puts n }
