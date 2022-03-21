# needs to be able to store all data types
class SimpleLinkedList

  # def reverse
  #   count = sequence.size - 1
  #   until count == 0 do
  #     next_guy = sequence[count - 1]
  #     next_guy.pointer = nil
  #     current = sequence[count]
  #     current.pointer = next_guy
  #     count -= 1
  #   end
  #   reversed = SimpleLinkedList.new
  #   reversed.sequence = sequence.reverse
  #   reversed
  # end
  def size
    
  end
end

class Element
  attr_reader :datum

  def initialize(datum, next_one = nil)
    @datum = datum
    @next = next_one
  end

  def next
    @next ? @next : nil
  end

  def tail?
    datum != nil
  end
end


















































# class SimpleLinkedList
#   attr_accessor :sequence

#   def initialize(sequence = [])
#     @sequence = []
#   end

#   def size
#     sequence.size
#   end

#   def empty?
#     sequence.empty?
#   end

#   def push(el) # last in first out, so it's the reverse
#     el = Element.new(el)
#     unless empty?()
#       el.pointer = sequence.first
#     end
#     sequence.unshift(el)
#   end

#   def pop # last in first out, so it's the reverse
#     sequence.shift.datum
#   end

#   def peek
#     sequence.first.datum unless empty?()
#   end

#   def head
#     sequence.first
#   end

#   def self.from_a(arr)
#     if arr.nil?
#       new(arr)
#     elsif arr.empty?
#       new
#     else
#       temp = new
#       arr.reverse_each { |el| temp.push(el) }
#       temp
#     end
#   end

#   def to_a
#     sequence.map(&:datum)
#   end

#   def reverse
#     count = sequence.size - 1
#     until count == 0 do
#       next_guy = sequence[count - 1]
#       next_guy.pointer = nil
#       current = sequence[count]
#       current.pointer = next_guy
#       count -= 1
#     end
#     reversed = SimpleLinkedList.new
#     reversed.sequence = sequence.reverse
#     reversed
#   end
# end

# class Element # may contain a range of data such as numbers
#   attr_reader :datum
#   attr_writer :pointer

#   def initialize(datum, pointer = nil)
#     @datum = datum
#     @pointer = pointer
#   end

#   def next # points @ next node
#     pointer if pointer
#   end

#   def tail?
#     datum != nil
#   end

#   def pointer
#     @pointer
#   end
# end

=begin

nodes are composed of (datum, next, tail?)

node1 -> node2 -> node3 -> nil

when we add to the sequence, we need to update the
  reference of the last-added element to point at added el

when we add an element, that element becomes the new head

=end

# require 'pry-byebug'
# require 'pry'
