=begin

add takes to arguments, a name (str) and a grade (num)

to_h converts and array of student indiv arrays into a hash object

grade returns a list of the individual students in a specified grade

=end

class School
  def initialize
    @array_of_arrays = Array.new
  end

  def add(name, grade)
    @array_of_arrays << [name, grade]
  end

  def to_h
    sorted = @array_of_arrays.sort { |a, b| a.first <=> b.first }

    sorted.each_with_object({}) do |(name, grade), hsh|
      hsh.key?(grade) ? hsh[grade] << name : hsh[grade] = [name]
    end.sort.to_h
  end

  def grade(grade)
    to_h[grade].nil? ? [] : to_h[grade]
  end
end
