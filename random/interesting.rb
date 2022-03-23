require 'pry'
# frozen string literal

# def test
#   puts 'entering method'
#   1.times { puts 'entering block'; return self }
#   puts 'exiting method'
# end

# what_is_self = test()
# p what_is_self

# --------------------------------------------------------

# def something(&block)
#   yield(self)
#   block.call(self)
# end

# def a_method
#   puts "I am #{self.class}"
# end

# something(&:a_method) # this is the same as: something { |obj| obj.a_method }
#                       # that is why we have to yield to or call this block and
#                       # pass in an object that can invoke `a_method`. If no
#                       # object is given, we get `no receiver` error.

# Let's pause here and look again at (&:to_s). This means that Ruby is trying
# to turn :to_s into a block, but it's not a Proc, it's a Symbol. Ruby will then
# try to call the Symbol#to_proc method -- and there is one! This method will
# return a Proc object, which will execute the method based on the name of the
# symbol.



# def a(array)
#   string = ''
#   idx = 0
#   while idx < array.size
#     string.concat '.', yield(array[idx])
#     idx += 1
#   end
#   string
# end

# # p method(:a).to_s
# val = a([1, 2, 3], &:to_proc)
# # p val # =>

# pr =  -> (arg) { arg }

# p pr.to_s



=begin
when ruby sees a `&` in method invocation (prepended to an argument), it tries turning
the argument into a block. (how?)
=end

# def a_method
#   Proc.new { |arg| p arg }
# end

# lbd = lambda { |arg| p arg }
# prc = proc { |arg| p arg }

# [1, 2].each(&lbd)
# [3, 4].each(&prc)
# [5, 6].each(&a_method)
# [7, 8].each()



=begin
when ruby sees a `&` prepended to a method parameter within a method definition, it
calls `to_proc` on the object referenced by that method parameter
- must pass a block
=end

# def a_method(arr) # all methods can take take blocks as arguments (explicitly or implicitly)
#   # yield
#   arr.each { |el| yield(el) }
# end

# a_method([1, 2, 3]) { |el| puts el ** 2 }


# class Person
#   def initialize(name, age)
#     @name = name
#     @age  = age
#   end

#   def make_a_proc
#     Proc.new
#   end
# end

# jesse = Person.new("Jesse Pinkman", 25)

# my_proc = jesse.make_a_proc() { puts 'hi' }

# make_a_proc { puts 'hi' }

# def proc_from
#   Proc.new
# end

# proc = proc_from { "hello" }

## proc.call   #=> "hello"

# random
# def practice(*args)
#   args.each { |el| puts el }
# end

# practice(1, 2, 3)
# practice([1, 2, 3])


# --------------------------------
# proc_obj = Proc.new { puts proc_obj.send(:a) }
# proc_obj = proc { puts a }
# def a # defined in main; therefore a private method in the Object class
  # 4
# end
# proc_obj.() # Proc#call invoked upon the Proc obj

# p self.class.private_methods # [:a] is private method of Object class


# b = 'string'.to_sym.to_proc
# a = 3

# def a_method(x, y)
#   y * x
# end


# p a_method(a, &b)



# --------------------------------
# def method_4(arg3)
#   arg1 = 'arg1'
#   arg2 = 'arg2'
#   proc { |*el| puts el, arg1, arg2, arg3 }
# end

# method_4('arg3').call('arg-3', 'arg-2', 'arg-1', 'arg0')



# ---------------------for Chris---------------------
# without running the code; explain the steps to the resulting output.
# def a_method(a_proc)
#   inner_proc = proc { |el| puts el }
#   a_proc.call(inner_proc)
# end

# outer_proc = proc { |arg| arg.call(3) }
# a_method(outer_proc)



# -------------------------for Chris------------------------

# def main_method(a_proc)
#   inner_proc = proc { |el| puts el }
#   binding.irb
#   second_method(a_proc.call(inner_proc))
# end

# def second_method(arg)
#   'Hi! ' * arg
# end

# some_var = 3
# outer_proc = proc { |arg| arg.call(some_var) }
# some_var = 5

# main_method(outer_proc)

# -------------------closure demonstration-------------------



# var = 'initialized before block/proc!'
# prc = proc { a_method other_method var } # what is going on here?

# def call_proc(&proc_obj)
#   yield
#   proc_obj.call
# end

# var = 'reassigning the variable...'

# def a_method(arg)
#   puts arg
# end

# def other_method(arg)
#   (arg * 3)
# end

# call_proc(&prc)

# var = 'reassigned???'

# what happens if we move our `other_method` definition down here?



# -------------------do...while w/ pry------------------- #

# require 'pry'
# str = '1'

# puts str

# loop do
#   str += str[0]
#   binding.pry
#   break if str.size > 10
# end

# puts str


# -------------------explicit/implicit block passing------------------- #
                              # named parameter to reference the block being passed to the method
# def a_method(word)#, &block)  # converts the block to a simple proc obj (thus `call`-able)
#   yield(word)                 # we can still use `yield` with our explicit block converted to a proc!
#   # block.call(word * 3)      # `call`-ing our proc obj
#   yield(word)
# end

# a_method('hi') { |arg| puts arg }



# -------------------pry practice------------------- #
# count = 0

# loop do
#   count += 1
#   count.times { puts 'hi!' }
#   binding.pry
# end

# [1, 2].each do |el|
#   puts el
# end



# -------------------for chris------------------- #

=begin
What core computer science concept affords us the ability to both reference and access the value
of a local variable initialized within the scope of a method *after* a method has returned?
Demonstrate the concept with a code example.
=end

# def math_operation(n)
#   # since the proc obj uses `n`; the variable name + it's current value
#   lambda { |*data| data.collect { |el| el ** n } }
# end

# square = math_operation(2) # both return lambdas
# cube   = math_operation(3)

# p square.call 1, 2, 3, 4, 5
# p cube.call 1, 2, 3, 4, 5



# -------------------bindings------------------- #


# def math_operation(n)
#   m = 3
#   lambda { |l| l + m + n }
# end

# square = math_operation(2)

# p square.binding.eval("n")
# p square.binding.eval("m")
# # p square.binding.eval("l") # will this work? how can we verify without running the code?
# p square.binding.local_variables
# p square.call(8)
# # p square.binding.eval("l") # how about now?



# -------------------bindings------------------- #

# array = [1, 2, 3]

# def a_method(arr)
#   proc { |arr| arr.collect! { |n| n ** 2 }} # returns proc obj
# end

# my_proc = a_method(array)

# p my_proc.binding.eval('arr') # => current value of method param `arr`

# my_proc.call(array)

# p my_proc.binding.eval('arr')


# -------------------bindings------------------- #

# def a_method(&a) # & converts `a` to a simple procedure object
#   a.class
# end

# a = proc { nil } # initializing a proc

# p a_method(&a) # & converts `a` to a block



# -------------------method object------------------- #

# def a_method(fn)
#   arg = 'hello!'
#   my_proc = method(fn.to_sym).to_proc # creates a Method object; converts that object to a proc
#   proc { arg }
# end

# def greet(el)
#   puts el
# end

# str = 'greet'

# something = a_method(str)
# p something.call
# p something.binding.local_variables
# my_proc.call('hi')

# -------------------eval/returning lambdas------------------- #

# def multiply_by(n)
#   n = 9
#   lambda { |data| data.collect { |x| x * n } }
# end

# doubler = multiply_by(2)
# tripler = multiply_by(3)

# doubler.binding.eval("n = 2")
# p doubler.call([1, 2, 3])
# p tripler[[1, 2, 3]]


# -------------------returning a block------------------- #

def block_returner(string)
  proc { puts string }
end

string = "I'm in a block!"

my_proc = block_returner(string)

my_proc.call
