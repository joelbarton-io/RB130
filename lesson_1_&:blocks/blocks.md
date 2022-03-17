# ...
blocks are just another argument being passed to a method; it's up to the
method's implementation to determine what to do with that block arg.

# writing methods that take blocks
- every method in Ruby can take an optional block as an implicit parameter

- we use `yield` to allow a method to pass execution control to the block
  - the yield keyword executes the block
  - if we want to have to option of passing a method a block, we can use a conditional with Kernel#block_given?
- blocks are an 'implicit parameter' (not part of the method definition)
- blocks can be thought of as anonymous functions


# yielding with an arg
- block args -> within a block, this is called a block local variable

- "upon invocation, moves to the method implementation"
- "execution is yielded to the block"
- unlike normal methods, blocks don't raise an `ArgumentError` if you
  pass in extra or fewer arguments than specified
- arity: rule regarding the number of arguments you must pass a block,  proc, or lambda
  - blocks and procs have *lenient arity* meaning that ruby wont complain
  - lambdas have *strict arity*; you must pass the correct # of args
## important: methods enforce argument counts; blocks do not*

# return value of yielding to the block
- just like normal methods, blocks have return values; we can use this return value (like assigning it to a local variable or using it in a conditional statement!)

- when we evaluate `nil` in string interpolation; => empty string

# when to use blocks ***
- two roles: method implementor and method caller

- using blocks adds flexibility by allowing method callers a way to refine implementation.
- the combination of generic methods and blocks allows for flexibility and refinement of implementation based on the caller's situation
- oftentimes, the method implementor doesn't care what the block code does
- blocks lend themselves well to 'beforeafter' comparisons of *something*
- 'sandwich code'
```ruby
def some_method(&block) # explicit block; can be referenced by a block local variable like `block`
  puts 'bread' * 3
  block.call # & converted the block: `block` to a simple `Proc` object, which we then invoke `call` upon
  puts 'bread' * 3
end
some_method { puts 'bacon, lettuce, tomator' } # method invocation with explicit block

# breadbreadbread
# bacon, lettuce, tomator
# breadbreadbread
```
# methods with explicit block param
- all methods accept an implicit block

- 'explicit block' is a block that is assigned to a method parameter and can be treated as a named object (we prefix it with `&`)
- `&` in meth.def converts block to 'simple proc obj'; inside we drop `&`
- invoking `call` upon a `Proc` object is an alternative to `yield`-ing

# using closures
- formed by blocks/procs/lambdas
- retain memory of their surrounding scope/context/environment
- can use/update variables in^this; closures carry this context around

- "...method returns a Proc that forms a closure with local variable ..."
- methods & blocks can return Procs and lambdas which can then be called

# summary
blocks...
- ...are a way to implement closures (passing around anonymous functions)

- ...can take args; won't complain if wrong # of args passed in
- ...always return a value
- ...are a way to defer implementation decisions to *method callers* (decision made @ time of execution); + allows for generic methods
- ...are great for sandwich code (before/after) situations where `/` is some block execution
- ...and methods can return a chuck of code using a `Proc` or `lambda`
