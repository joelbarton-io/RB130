# Without running the code, what is the output on line 13 and why?

# def outer_method(num, &block) # block = simle proc obj
#   num += yield # num reassigned to 7
#   inner_method(num, &block) # converting proc obj to a block
# end

# def inner_method(num, &block) # 7, block = simple proc object
#   num + yield
# end

# proc_obj = proc { 4 }
# puts outer_method(3, &proc_obj) # invoking outer_ with 3 and a block
# # 11, nil

# are we allowed to return proc objects from methods

def a_method
  Proc.new { |el| return el } # break
end

# my_new_proc = a_method() # => new proc obj?
# my_new_proc.call(3) # => 3?

# my_proc = proc { |num| return num if num > 2 } # exchange `return` for `break`?

# [1, 2, 3].each(&my_proc) # will this work?

[1, 2, 3].each { |num| break p 'broke out!' if num.odd? }
# break from proc-closure (LocalJumpError)

# def other_method(*args) # unknown # of arguments in array
#   args.each do |num|
#     p num
#   end
# end

# other_method(1, 3, 5, [], :to_s)

# def a_method(arg, *arg2)
#   p arg  # => 1
#   p arg2 # => [2, 3, 7, 9, 5, 4]
# end

# arr = [1, 2, 3, 7]
# arr2 = [9, 5, 4]

# a_method(*arr, arr2)

# usecases
  # in invocation -> pass single collection; assign to method parameters
  # in definition -> define some unknown # of args; store as collection

# proj_obj1 = proc { |num| puts "#{num}" } # lenient arity
# proj_obj1.call() # very similar to blocks

# lbm = -> (arg)
# lbm.call(4) # very similar to methods
# puts &proj_obj1.call(2) #.to_s
# p &proj_obj1

