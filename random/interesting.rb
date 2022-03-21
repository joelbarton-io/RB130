require 'irb'
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



# --------------------- for Chris ---------------------
# without running the code; explain the steps to the resulting output.
# def a_method(a_proc)
#   inner_proc = proc { |el| puts el }
#   a_proc.call(inner_proc)
# end

# outer_proc = proc { |arg| arg.call(3) }
# a_method(outer_proc)



# --------------------- for Chris ---------------------

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

# ----------------------------------------------------
var = 'initialized before block/proc!'
prc = proc { a_method other_method var } # what is

def call_proc(&proc_obj)
  yield
  proc_obj.call
end

var = 'reassigning the variable...'

def a_method(arg)
  puts arg
end

def other_method(arg)
  (arg * 3)
end

call_proc(&prc)

# what happens if we move our `other_method` definition down here?
