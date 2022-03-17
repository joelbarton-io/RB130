# def foo(&block) # block converted to a simple proc obj
#   p block.call # block points at => proc obj
# end

# def a_method
#   self
# end

# proc_obj = proc { a_method }
# # p proc_obj.call

# foo(&proc_obj) # & converts proc/lambda into block
# # => Proc .....


# other_var = 3 # must be initialized before proc object instantiation (creation of closure?)
# proc_1 = proc { |arg| arg ** other_var } #

another_proc = Proc.new {}

# a simple proc obj
proc_obj = Proc.new { puts proc_obj.send(:a) } # instantiation of proc obj

def a # defined in main; therefore a private method in the Object class
  4
end

proc_obj.() # Proc#call invoked upon the Proc obj

[].each do

end
