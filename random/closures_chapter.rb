=begin
# def my_method(arg)
#   yield(arg)
# end

# my_method(3) { |blk_arg| puts blk_arg ** 3}


# def my_method(arg, proc_arg)
#   proc_arg.call(arg)
# end

# local_var = 5
# proc_obj = proc { |blk_arg| puts blk_arg ** local_var }

# def local_var
#   5
# end

# my_method(local_var, proc_obj)

# local_var = 100

# def local_var
#   100
# end

# def my_method(int, lamb)
#   puts lamb.call(int, lamb.call(int, int))
# end

# lambda_obj = lambda { |arg, arg2| arg ** arg2 }

# my_method(3, lambda_obj)
=end

# one (longish) way to create a proc

# def scoped_within_method
#   "VALUE"
# end

# def my_method(&bl)
#   scoped_within_method = "value"
#   [bl, scoped_within_method, call(:scoped_within_method)]
# end

# proc_obj, *some_string = my_method { |arg| p arg } # what happens if we exchange `puts` for `p`?

# local_var = proc_obj.call(some_string) if proc_obj.instance_of?(Proc)

# puts local_var.class



# chris unary

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

# # something { |obj| obj.a_method }

# nil

# proc_1 = proc { |x, y| x ** y }

# p proc_1.==(proc_2)

# z = proc_1[3, 3] # alternate invocation syntax for proc objects

# p z

# def test(&proc_obj)
#   proc_obj.call([1, 2, 3])
# end

# proc_1 = lambda { |*arg| puts arg }

# p proc_1.arity # - mandatory arguments - 1

# test(&proc_1)

# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc # Proc ...>
# puts my_proc.class # Proc
# my_proc.call # This is a.
# my_proc.call('cat') # This is a #{cat}.

# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class # proc
# my_lambda.call('dog') # this is a dog.
# my_lambda.call # wrong number of arguments
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # lambda isn't a class

# def block_method_1(animal)
#   yield # should yield to block, if non given, local jump error
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}." }
# block_method_1('seal')
# def call_block
#   begin
#   yield 42
#   rescue LocalJumpError
#     puts "No block was given; yield requires a block!"
#   end
# end

# call_block()

# def get_me_a_return
#   Proc.new do
#     begin
#     return 42
#     rescue LocalJumpError
#     p "Unexpected explicit return used!"
#     end
#   end
# end

# get_me_a_return.call

# proc_1 = proc { return 42 }

# p proc_1.call

# return


# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }

# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end

# block_method_2('turtle')
# { puts "This is a #{animal}." }

=begin

all lambdas are procs;
procs and lambdas are objects (proc objects)
blocks are a code structure; they are not objects
procs allow us to assign and refer to some functionality (the block)
  by assigning it to a variable.

=end
# class A
#   attr_reader :arr

#   b = :symbol

#   def initialize(arr)
#     @arr = arr
#   end

#   def symbol
#     puts 'hi'
#   end

#   def each()
#     arr.each do |el|
#       yield(el)
#     end
#     self
#   end
# end

# instance = A.new([1, 2, 3])

# instance.each(&:symbol)


# # [1, 2, 3].each(&:symbol)

arr = [1, 2, 3]
add_one = proc { |num| num + 1 }

p arr.map(&:next)    # => [2, 3, 4]
p arr.map(&:succ)    # => [2, 3, 4]
p arr.map(&add_one)  # => [2, 3, 4]
