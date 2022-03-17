"how to get an 'A' in Launch school"

- don't be over confident!
- you should be anxious about it!
- where am I losing points?
- read all the forums/articles!
- repeat everything; there has to be repetition

"three things to worry about"
- & -> proc to block; block to proc; `proc`/`Proc.new`
  - lambdas are types of proc objects
  - arity of lambdas? -> strict arity

```ruby
def method1(&block) # turns block back into a proc; there are two: side by side
 puts yield #.class
 puts block.call #.class exception thrown?
 puts yield
end

this_is_a_proc = proc {'is this a proc?'}

method1(&this_is_a_proc) # converts whatever is passed to a block!
```
- method invocation &
- method implementation &

```ruby
def change
 456
end

change = 123

def example
 puts yield
end

example {change}
```
- prioritizes local variables to method definitions
- memorize everything!

```ruby
def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call           # => 1
p s1.call           # => 2
p s1.call           # => 3
puts

s2 = sequence
p s2.call           # => 1
p s1.call           # => 4 (note: this is s1)
p s2.call           # => 2
```
- suggest we tackle hard question first!
- a very long test! set timers!

- read the regex book! super helpful going forward.

```ruby
# def sequence
#   counter = 0

#   proc_1 = Proc.new { counter += 1 }

#   counter = 100

#   proc_1
# end

# # sequence = "i'm a string!"

# s1 = sequence
# p s1.call # 101

# my_proc = Proc.new {|num| num * 3 }
my_proc = proc {|num| num * 3 }
p my_proc[3] #

p my_proc.call(3)

# counter = 0
# p counter
# proc_1 = Proc.new { counter += 1 } # counter, sequence()

# counter = 100 # this change is reflected
# p counter

# p proc_1.call
# s1 = sequence
# p proc_1.call #

# p proc_1.call #
```