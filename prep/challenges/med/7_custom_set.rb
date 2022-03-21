class CustomSet
  def initialize(container = [])
    @container = container
  end

  def empty?
    container.empty?
  end

  def contains?(el)
    container.include?(el)
  end

  def subset?(other)
    container.all?(&other.method(:contains?))
  end

  def shares_all_elements?(other)
    container.all?(&other.method(:contains?))
  end

  def disjoint?(other)
    container.none?(&other.method(:contains?))
  end

  def eql?(other)
    container.uniq.size == other.container.uniq.size && shares_all_elements?(other)
  end

  def add(el)
    container << el unless contains?(el)
    self
  end

  def ==(other)
    container == other.container
  end

  def intersection(other)
    CustomSet.new(container.select(&other.method(:contains?)))
  end

  def difference(other)
    CustomSet.new(container - other.container)
  end

  def union(other)
    other.container.each { |el| container << el unless contains?(el) }
    self.container = container.sort
    self
  end

  protected

  attr_accessor :container
end
