=begin
      4
    /   \
   /     \
  2       6
 / \     / \
1   3   5   7

base case -> num can become a new node

=end

class Bst
  attr_reader :data, :left, :right

  def initialize(root)
    @data = root
  end

  def insert(n)
    case n <=> data
    when 0, -1 then @left.nil? ? @left = Bst.new(n) : @left.insert(n)
    when 1     then @right.nil? ? @right = Bst.new(n) : @right.insert(n)
    end
  end

  def each(&block)
    return to_enum unless block_given?
    left&.each(&block)
    block.call(data)
    right&.each(&block)
  end
end

=begin
  attribute readers for @data, @left, @right

  constructor function; initialize @data to root

- insert method -
-> compare passed-in value to current node data
  -> less than or equal to current node data?
    -> if @left is nil, assign @left to new node object
    -> otherwise -> invoke insert upon @left passing in new value
  -> otherwise;
    -> if @right is nil -> assign @right to new node object
    -> otherwise -> invoke insert upon @right passing in new value
=end

# class Bst
#   attr_reader :data

#   def initialize(data)
#     @data  = data
#     @left  = nil # <= current node's data
#     @right = nil # >  current node's data
#   end

#   def insert(num)
#     unless @left.nil? || @right.nil?

#       # if num <= @data
#       #   @left = Bst.new(num)
#       # elsif num > @data
#       #   @right = Bst.new(num)
#       # end
#   end

#   def right
#     @right
#   end

#   def left
#     @left
#   end

#   def record_all_data(instance)
#   end

#   def each
#   end
# end

# four = Bst.new 4
# four.insert 2
# four.insert 6
# p four
# assert_equal 4, four.data
# assert_equal 2, four.left.data
