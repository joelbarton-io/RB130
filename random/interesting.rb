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
What core computer science concept affords us the ability to both reference and access the value of a local variable initialized within the scope of a method *after* a method has returned?Demonstrate the concept with a code example.
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
#   Proc.new(&) { |el| puts string * el }
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
# ------------------------------weird; alternate syntax for block arguments------------------------------ #
# explicit args
# %w[test me please].each { |str| puts str.upcase } # prints TEST, ME, PLEASE
# (1..5).map { |i| p i**2 } # => [1, 4, 9, 16, 25]

# # implicit args
# %w[test me please].each { puts _1.upcase } # prints TEST, ME, PLEASE
# (1..5).map { _1**2 } # => [1, 4, 9, 16, 25]
# ---------------------------------*********------------------------------- #
# ---------------------------------SB quiz 1------------------------------- #
# ---------------------------------*********------------------------------- #

##  0 What is closure?


##  1 What are closures?


# in ruby closures take the form of blocks, procs, lambdas, and method objects. Essentially, a closure is a chunk of code that retains memory of the environment where it was first defined.  This includes the artifacts of the environment (method definition names, variable names and their values, etc...); it has access to these artifacts even when the procedure object is in a different environment or execution context from where it was created.

##  2 What is a binding in relation to closures?


# when we create a proc object, that objects holds on to the bindings of all the variables used by the proc object's encapsulated block; if the block uses an artifact in its scope of creation, then the binding for that artifact is held by the proc object.
# Technically, **all** references are carried around by the proc, even if they aren't actually used by the chunk; the bindings are still accessible

##  3 How do you create a closure in Ruby?

# we can create closures by encapsulating a chunk of code inside a proc object; closure can occur whenever we use a chunk of code in a context other than where that chunk of code was originally defined.

##  4 When should you write a method that takes a block?

# writing a method that takes a block is the right thing to do when we want to defer specific implementation details until
# the time of invocation.  we can write a generic method that yields to a block, the details of which we aren't concerned with
# while we are defining the method.

# additionally, we sometimes want to perform some sort of before/after procedure upon some data.  yielding to a block between
# parts of our code is a practice called 'sandwich code' and allows us to perform some sort of operation, then yield to the block,
# then perform some other, related operation following the yielding to the block.

##  5 What kinds of methods can take a block? standard vs custom? -> all methods can take a block. (implicit block passing)

##  6 Provide an example of a method definition, calling object, block, and method invocation

# def a_method(arr) # method definition
#   arr.map { yield(_1) }
# # ^calling object
# end

# # method invocation
# p a_method([1, 2, 3]) { |el| el * 3 }
# #                     ^block        ^


##  7 You are writing a #welcome method that takes one argument, a string that denotes a greeting, and a block that returns a string. The method must output the argument value followed by a space, (if the block is given) the value returned by the block. Fix the method.

# def welcome(str)
#   p str + ' ' + yield
# end

# welcome('Hello') { 'there' } # => Hello there
# welcome('Hey') { 'Joe' } # => Hey Joe


##  8 What do we know about block parameters and the number of arguments passed to a block? What is this called?
# normal proc objects and blocks have relaxed rules about the require number of arguments being passed.  Lambdas have strict rules (much like methods) and enforce strict arity.


##  9 What does the following error mean?
# LocalJumpError: no block given (yield) -> this means that we defined a method to yield to a block that was never passed to the method

##  10 What is the method block_given? " "
# what does block_given? do -> checks if a yield in the current context would execute a block
# what class is it a method from? -> Kernel
# what output does it have? -> boolean

##  11 In method definition what does & do in front of an argument?

# def true_or_false(&block) # -> transforms arg into a basic proc object (P  arameter -> P  roc)
#   puts "The block is #{block.call}"
# end

# true_or_false { 5 > 8 }

##  12 What will the following code output and what is included in the binding on line `5`?

# def call_chunk(code_chunk)
#   code_chunk.call
# end

# say_color = Proc.new { puts "The color is #{color}" } # NameError thrown
# color = "blue" # must be initialized before closure event
# call_chunk(say_color)

##  13 In the following code there is &:capitalize. What is this code doing and what does it demonstrate?
# "the cat in the hat".split.map(&:capitalize).join(' ') # => "The Cat In The Hat"

# & transforms the :capitalize symbol (a reference to the capitalize method) to a proc by calling to_proc upon it, this proc is then converted to a simple block when is then yielded to by the iterator for each successive element in the collection


##  14 What is the expanded code for the following example?
# [2, 3, 5].inject(1, &:+)

# [2, 3, 5].inject(1) { |memo, curr| memo + curr }

##  15 Which names are part of the binding for the block body on line 12?

# ARRAY = [1, 2, 3]

# def abc
#   a = 3
# end

# def xyz(collection)
#   collection.map { |x| yield x }
# end

# xyz(ARRAY) do
#   # block body
# end

# ------------------------question------------------------ #
# In the below code we have two local variables, one of which is referenced (used) in the block encapsulated in the proc object.  My question: is the binding for var_two held by the proc object even though it
# def a_method(prc_obj)
#   prc_obj.call(3)
# end

# var_one = 5
# var_two = 10 # <- no reference to this var in the below...

# my_proc = proc { |exp| var_one ** exp }
# a_method(my_proc) # => 125
# It would seem that it is, since when we call binding.eval("var_two") upon the passed in proc_obj, we can access the object that it was pointing at.
# def a_method(prc_obj)
#   prc_obj.binding.eval("var_two")
# end

# var_one = 5
# var_two = 10 # <- ?

# my_proc = proc { |exp| var_one ** exp }
# a_method(my_proc) # => 10


# ---------------------------------------------------------------- #
# def a_method
#   'hi'
# end

# def other_method()
#   puts 'hello there!'
# end

# def main_method(prc)
#   prc.call
# end

# var = 'some text'

# greeting_1 = method(:a_method).to_proc
# greeting_2 = method(:other_method).to_proc

# my_proc = proc { puts var }

# p binding.local_variables
# # main_method(my_proc)

# ---------------------------------*********------------------------------- #
# ---------------------------------SB quiz 2------------------------------- #
# ---------------------------------*********------------------------------- #


## 1 What are regression tests and why are they useful?
# -> regression tests are tests designed to ensure that once we make a changes our code still works as intended (e.g. our new addition doesn't break the existing code).  They allow us to build up our code while being confident that newly-added material doesn't cause any substantial issues to the healthy running of our code.


## 2 Define an Assertion, Test, and Test Suite
# "test" : context within which tests are run; can contain multiple assertions; "test suite" : all the tests that accompany a project; "assertion" : actual verification step; "did we get what we expected?"; a test contains one or more


## 3 Compare and Contrast RSpec and Minitest
# Rspec is a DSL (domain specific language) that uses the 'expect'-style syntax. It is written in plain english and is very popular. Minitest uses normal Ruby syntax, is included in the Ruby Core/Standard library, uses 'assert' style syntax, and does much of what RSpec can do via additional gems and extensions.  Is known as being more simple to use and thus more beginner friendly.


## 4 - 5 What is SEAT?
# Seat is basically just an approach for writing and implementing tests. We setup, execute our code, evaluated there result, then tear down any artifacts that need to be cleaned up.


## 6 What happens specifically in the set up and tear down steps?
# in setup, we create any objects we will use in our execution and assertion steps.  In tear down, we clean up any remaining artifacts ought to not exist anymore.


## 7 What method does assert_equal use?
# assert_equal invokes the `==` method defined for the expected object/value and compares it with the actual object. This


## 8 What do you need to do to run minitest? (What do you need to include on the test file?)
# require 'minitest/autorun', require_relative 'name_of_file_to_test'. We also need to subclass our testing class from Minitest::Test, we might also require 'minitest/reporters' and enable them.


## 9 -14 Define these common assertions and how to use them
# assert -> the expression that follows assert will be evaluated; assert will pass if the expression evaluates to truthy
# assert_match -> matches an expected regexp with the actual string value
# assert_raises -> makes sure an exception is raised when a certain event occurs
# refute -> inverse to assert; basically !assert (expression)
# assert_equal -> compares equality based on the class of expected object

## 10
## 11
## 12 Will test_is_not_purrier pass or fail or have an error?

# You update the initialize method of your Cat class to take a second argument and assign it to a @purr_factor instance variable. You also add an equivalent attr_accessor.
# require 'minitest/autorun'

# class Cat
#   attr_accessor :name, :purr_factor

#   def initialize(name, purr_factor)
#     @name = name
#     @purr_factor = purr_factor
#   end

#   def miaow
#     "#{name} is miaowing."
#   end
# end

# class CatTest < MiniTest::Test
#   def setup
#     @kitty = Cat.new('Kitty', 3)
#   end

#   def test_is_cat; end

#   def test_name
#     @milo = Cat.new('Milo', 3)
#     assert_equal(@milo.name, @kitty.name)
#   end

#   def test_miaow; end

#   def test_raises_error; end

#   def test_is_not_purrier
#     patch = Cat.new('Patch', 5)
#     milo = Cat.new('Milo', 3)

#     refute(patch.purr_factor > milo.purr_factor) # -> exp evaluates true, so test fails
#   end
# end


## 13 What does this output mean?
# CatTest .FS. -> two passes, one fail, one skip

## 14 Given the following output what implementation of #test_name assertion would produce this output?
#   1) Failure:
# CatTest#test_name [minitest_test.rb:21]:
# Expected: "Milo"
#   Actual: "Kitty"

## 15 What is code coverage? -> essentially it's the amount of code that your test suite touches once you've run all your tests.  It's often good to strive for 100% coverage, but this is in no way means that you're code won't have bugs or that the tests you've written cover every possible edge case.  Still a good habit to get into trying to reach 100 percent coverage starting out.



# ---------------------------------*********------------------------------- #
# ---------------------------------SB quiz 3------------------------------- #
# ---------------------------------*********------------------------------- #

## 1 Define the following tools.
## 2
## 3
## 4
# RubyGems -> a repository where all RubyGems live and can be sourced from
# Bundler -> a gem that ensures all the necessary dependencies are loaded in order to execute associated ruby code.
# RVM -> ruby version manager; ensures that we are using the correct version
# Rake -> a gem we use to automate common tasks like tests, etc...
# Rbenv -> another version manager

## 5 What file would have the following code?
# GEM -> Gemfile.lock
#   remote: https://rubygems.org/
#   specs:
#     mustermann (1.0.0)
#     pg (0.21.0)
#     rack (2.0.3)
#     rack-protection (2.0.0)
#       rack
#     sequel (4.48.0)
#     sinatra (2.0.0)
#       mustermann (~> 1.0)
#       rack (~> 2.0)
#       rack-protection (= 2.0.0)
#       tilt (~> 2.0)
#     tilt (2.0.7)

# PLATFORMS
#   ruby

# DEPENDENCIES
#   pg (~> 0.21.0)
#   sequel (~> 4.48)
#   sinatra (~> 2.0)

# RUBY VERSION
#   ruby 2.6.3

# BUNDLED WITH
#   1.15.1

## 6 What file would have the following code?
# source 'https://rubygems.org' -> Gemfile

# ruby '2.6.3'

# gem 'sinatra', '~> 2.0'
# gem 'postgres', '~> 0.8.1'
# gem 'sequel', '~> 4.48'
# gem 'minitest', '~> 5.10'
# gem 'minitest-reporters', '~> 1.1'
# gem 'rake', '~> 12.0'

# gemspec

## 7 What file would have the following code? -> Rakefile
# desc 'Run tests'
# task :test do
#   sh 'ruby ./test/my_app_test.rb'
# end

# desc 'Run tests'
# task :default => :test

## 8 Where do Gemfile and Gemfile.lock come from? Which tool are they used with?# used by Bundler, when we bundle install, a gemfile.lock is created from Gemfile containing a bunch of dependancy related information as well as the version of ruby to use, etc...
## 9 What are they?

## 10 How do you create a Gemfile.lock? -> run bundler install

## 11 How do you fix the following error?
# ruby my_app.rb
# Gem::LoadError: You have already activated rake 11.3.0, but your Gemfile requires rake 10.4.2. bundler exec rake

# def a_method
#   Proc.new
# end


# question_mark = a_method { puts 'hi' }
# question_mark[]


# ------------------------for chris------------------------ #
=begin
def introduce_yourself(introduction)
  me = "Joel"
  introduction.call
  introduction.call(me)
end

me = "Chris"
my_bit = Proc.new { |me| puts "Hello, my name is #{me}." }
introduce_yourself(my_bit)
=end



# def a_method(prc)
#   # p prc.binding.local_variables
#   name = prc.call
#   p prc.call(name)
# end

# name = 'Joel'
# obj = proc { |name| name }
# a_method(obj)

require 'pry'

def a_method(b) # converts to a proc object
  yield
  # if block_given?
  b.call
  # end
  # binding.pry
end

a_method(&proc { p 'hi there' }) # converts to a block

# What's the difference between `yield` and prc_name.call ??

