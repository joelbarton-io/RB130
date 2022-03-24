# require 'pry'
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

# def block_returner(string)
#   proc { |el| puts string * el }
# end

# string = "I'm in a block! "
# my_proc = block_returner(string)
# p my_proc[3]


# -------------------to_sym------------------- #
# def a_method
#   local_var = 'value'
# end

# arr = [1, 2, 3, 4]
# ope = ['+', '-', '*', '/']

# p proc { |el| el * 3 }.binding.local_variables

# p binding.eval("arr")


# -------------------PRACTICE QUESTIONS------------------- #

# 16, What does & do when in a the method parameter? -> converts var to proc obj

# def method(&var); end

# 17, What does & do when in a method invocation argument? -> converts var to a block

# method(&var)

# 18, What is happening in the code below?

# arr = [1, 2, 3, 4, 5]

# p arr.map(&:to_s) # specifically `&:to_s` -> we are calling to_proc on the symbol, which then converts the new proc to a block obj

# 19, How do we get the desired output without altering the method or the method invocations?

# def call_this
#   yield(2)
# end
# to_s = proc { |el| el.to_i }
# to_i = proc { |el| el.to_s }

# p call_this(&to_s) # => returns 2
# p call_this(&to_i) # => returns "2"

#****************************************************************# 20, How do we invoke an explicit block passed into a method using &? Provide example.

# def a_method(&block)
#   block[]
# end

# a_method { puts 'hi' }


# 21, What concept does the following code demonstrate? -> sandwich code

# def time_it
#   time_before = Time.now
#   yield
#   time_after = Time.now
#   puts "It took #{time_after - time_before} seconds."
# end

# 22, What will be output from the method invocation block_method('turtle') below? Why does/doesn't it raise an error?

# def block_method(animal)
#   yield(animal)
# end

# block_method('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# => 'This is a turtle and a ' -> non-strict arity for blocks/procs!


# 23, What will be output if we add the follow code to the code above? Why? -> NameError bc block was not defined to take any arguments, unless we define an 'animal' lv or method in the lexical scope of the block, an error will be thrown

# animal = 'goat'
# block_method('turtle') { puts "This is a #{animal}." }


# 24, What will the method call call_me output? Why?

# def call_me(some_code)
#   some_code.call
# end

# name = "Robert"
# chunk_of_code = proc { puts "hi #{name}" } # create a procedure obj, `name` is part of the closure's binding since it was initialized before the creation of the proc/block.  the value of name is then reassigned to `Griffin`.
# name = "Griffin"

# call_me(chunk_of_code) # here we pass the proc `chunk_of_code` as an argument to `call_me`, where we invoke `call` upon the proc, executing the block stored within, which outputs to the screen `hi Griffin`.

# 25, What happens when we change the code as such:

# def call_me(some_code)
#   some_code.call # when we try to call the block inside the proc obj, a NameError will be thrown since `name` was initialized after the creation of the proc and as such is not part of the closure's binding.
# end

# chunk_of_code = Proc.new {puts "hi #{name}"}
# name = "Griffin"

# call_me(chunk_of_code)

# 26, What will the method call call_me output? Why?

# def call_me(some_code)
#   some_code.call
# end

# name = "Robert"

# def name
#   "Joe"
# end

# chunk_of_code = Proc.new {puts "hi #{name}"}

# call_me(chunk_of_code) # outputs `hi Robert`; lv have a higher precedance than methods, therefore the `name` local variable is found first and is what is referenced on line 487. To be clear, both the lv `name` and the method `name` are a part of the closure's binding.

# 27, Why does the following raise an error?

# def a_method(pro)
#   pro.call
# end

# a = 'friend'
# a_method(&a) # because we attempt to invoke `to_proc` upon the string object referenced by lv `a`; you can't convert a string object to a proc object. prepended to an argument within a method invocation, `&` expects the argument to be a proc object since it wants to convert the expected proc into a standard block.  Since the object referenced by `a` is a string, `&` tries to invoke `to_proc` upon in but fails since that method isn't available to instances of the String class.

# ****************************************************************28, Why does the following code raise an error?

# def some_method(&block)
#   yield if block_given?
# end

# bl = proc { puts "hi" }

# p some_method(&bl) # because we try to assign a local variable to a block structure on 506.  Blocks are not objects and can therefore not be directly referenced by a variable.  If we want to be able to reference (and thus pass around some chunk of code; the block), we need to encapsulate that block inside a proc object. We could modify the code to make this work by prepending "proc" to the {...} on line 506 and prefix the `bl` with a `&` and adding a `yield if` before `block_given?` on line 503 as well as prefixing a `&` to `block` within the method definition.



# ********************************29, Why does the following code output false?

# def some_method(block)
#   block_given? # no block is given since `block` points at the proc object initialized on line 518 so `block_given?` returns `false`
# end

# bloc = proc { puts "hi" } # create proc object

# p some_method(&bloc) # pass the return value of invoking `some_method(bloc)` to `p`.

# ********************************30, How do we fix the following code so the output is true? Explain

# def some_method#(block)
#   block_given? # we want this to return `true`
# end

# bloc = proc { puts "hi" } # do not alter this code

# p some_method(&bloc) # unary & converts the proc obj to a basic block which some_method is passed, since it's a block now, block_given? returns `true`


# 31, How does Kernel#block_given? work?

# `block_given?` returns `true` if `yield` would execute a block in the context of where `block_given?` is invoked.


# 32, Why do we get a LocalJumpError when executing the below code? & How do we fix it so the output is hi? (2 possible ways)

# def some(block)
#   yield
# end

# bloc = proc { p "hi" } # do not alter

# some(bloc) # error because we aren't actually passing a block to the `some` method invocation. Since we defined our method with a `Yield` and since `yield` expects a block, an exception will be raised since yield doesn't have a block to yield to.


# 33, What does the following code tell us about lambda's? (probably not assessed on this but good to know)

# bloc = lambda { p "hi" }

# bloc.class # => Proc
# bloc.lambda? # => true

# new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda

# lambda isn't a class in ruby, it's a type of `proc` that has strict arity enforcement

# 34, What does the following code tell us about explicitly returning from proc's and lambda's? (once again probably not assessed on this, but good to know ;)

# def lambda_return
#   puts "Before lambda call."
#   lambda {return}.call # simply returns from
#   puts "After lambda call."
# end

# def proc_return
#   puts "Before proc call."
#   proc {return}.call # returning from a block encapsulated by a proc returns to main (effectively ending whatever method that proc object is being executed in)
#   puts "After proc call."
# end

# lambda_return #=> "Before lambda call."
#               #=> "After lambda call."

# proc_return #=> "Before proc call."

=begin
# 35, What will #p output below? Why is this the case and what is this code demonstrating?

def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end

arr = retained_array
arr.call('one')
arr.call('two')
p arr.call('three')
=end
# ------------------------------------------------------------ #
# explicit args
%w[test me please].each { |str| puts str.upcase } # prints TEST, ME, PLEASE
(1..5).map { |i| p i**2 } # => [1, 4, 9, 16, 25]

# implicit args
%w[test me please].each { puts _1.upcase } # prints TEST, ME, PLEASE
(1..5).map { _1**2 } # => [1, 4, 9, 16, 25]
