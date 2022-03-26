def a_method(prc)
  p prc.binding.local_variables # => [:proc_obj, :c, :d]
  p prc.binding.eval("d") # => nil           <<------- 3
  p prc.call(prc.binding.eval('c')) # => 10  <<------- 4
end

proc_obj = proc do |num| # proc creation
  num + 7
end

p proc_obj.binding.local_variables # => [:proc_obj, :c, :d] <<------- 1

c = 3 # initialized AFTER creation of proc; still part of the binding of our proc object <<------- 2

a_method(proc_obj) # passing our proc object to our a_method as an arg

d = 15 # initialized AFTER proc creation and AFTER method invocation; variable name `d` IS part of the binding of our proc object

# I was studying with @Alex R this morning and we came across some confusing behavior that we couldn't quite explain re: local variables and closure as well as the mechanism by which name bindings are held by proc objects once the context where the proc was created is left. Here's an example:

# There's a lot going on, so I'll direct y'all's attention to the arrowed lines. Marker 1 establishes our baseline understanding of which local variables are part of the binding of our chunk of code encapsulated in our proc object.  There's nothing too suprising here except that the local variable which references said proc object is included (and thus could be used within our chunk of code!). All of this is not too hard to explain; it's just another local variable in the surrounding environment of our proc object.

# At marker 2, we initialize local variable `c` which references an integer. (We'll come back to this one in a second)

# Moving into the implementation details of `a_method`, at marker 3, the variable name of `d` seems to be at least partially visible (no exception is thrown and we see it in the array returned from the previous line), yet the value it references is NOT accessible.  The same can not be said for local variable `c` and its value as the code at marker 4 executes without an exception and returns `10`. This difference loosely 'makes sense' since `d` was initialized after the invocation of `a_method` whereas `c` was initialized prior to the method invocation, yet I'm still struggling with the specifics of how bindings facilitate closures.


def a_method(prc)
  p prc.binding.local_variables
  p prc.binding.eval("d") # <<------- 3
  p prc.call(prc.binding.eval('c')) # <<------- 4
end

proc_obj = proc do |num|
  num + 7
end

p proc_obj.binding.local_variables # <<------- 2

c = 3 # <<------- 2
a_method(proc_obj)
d = 15












def a_method(prc)
  p prc.binding.local_variables
end

my_proc = Proc.new do |num|
  p num #+ c # not allowed
end

p my_proc.binding.local_variables

c = 3

a_method(my_proc)
my_proc.call(c) # 3






# arr = [1, 2, 3]


# my_method = method(:+).to_proc
# # p my_method.class # method

# p arr.map(&my_method) # method obj -> 'proc' -> block


# # p arr.map { |num| num.to_s }
# # to_s is now a proc -> |??| -> to_s is now a block
