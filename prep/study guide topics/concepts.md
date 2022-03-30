- [questions](./concepts.md#questions)
- [blocks](./concepts.md#blocks)
- [closures](./concepts.md#closures)
- [binding](./concepts.md#binding)
- [scope](./concepts.md#scope)
- [why/when blocks](./concepts.md#why/when-blocks)
- [blocks and variable scope](./concepts.md#blocks-and-variable-scope)
- [methods using blocks/procs](./concepts.md#methods-using-blocks/procs)
- [explicit block parameter](./concepts.md#explicit-block-parameter)
- [return values with blocks](./concepts.md#return-values-with-blocks)
- [passing blocks](./concepts.md#passing-blocks)
- [unary &](./concepts.md#unary-&)
- [arity](./concepts.md#arity)
- [minitest](./concepts.md#minitest)
- [minitest v rspec](./concepts.md#minitest-v-rspec)
- [testing terms](./concepts.md#testing-terms)
- [SEAT](./concepts.md#SEAT)
- [assertions](./concepts.md#assertions)
- [packaging code](./concepts.md#packaging-code)
- [core tools purpose](./concepts.md#core-tools-purpose)
- [gemfiles](./concepts.md#gemfiles)
- [regex](./concepts.md#regex)

# questions

- **What is closure?**
  - *"a technique for implementing lexically scoped name binding"*
  - essentially, when we write a block of code, the artifacts of the enclosing scope of that block are part of the binding of that chunk of code.  Depending on the type of artifact and if the block needs to access the referenced value, the visibility of the variable is determined by the type of variable and the specific location in code.

- **What are closures?**

- `Proc` objects are closures, meaning they remember the entire context within which they were created/instantiated and can reference l-vs/values

- blocks are how Ruby implements closures (chunk of code that is passed around/executed some later time). This chunk of code is represented by a `Proc` object, a `lambda`, or a block!
- the surrounding context of the chunk of code is called its (the chunk's) **binding**
- "artifacts" : method references, constants, local variables, etc...


  - *"a piece of code that carries or retains its creation context around with it"*
  - 3 (4) ways to create a closure -> blocks, procs, lambdas, and method objects

  - implemented through the use of blocks and proc objects
    - a local variable must be initialized before the block/proc for it to be part of the block/proc's binding* (except this isn't true)
    - on the other hand, methods (and their names) can be declared after a block chunk and will be part of the binding (unless they are defined below where the block/proc is used)
- **What are blocks?**
  - a syntactic structure that we can pass to methods as an argument or store as part of a proc object's state
  - serve as anonymous functions; hold and carry around the name references (artifacts) present where they are first instantiated (?)
- **What are Procs and lambdas? How are they different?**
  - procs and lambdas are the containers where we store anonymous functions; they serve to encapsulate behaviors, these behaviors carry with them the references present in the lexical scope wherein they were originally defined
- **How do closures interact with variable scope?**
  - the only type of variable that has "new" behavior; local variables initialized before the creation of the proc/block/lambda are part of the binding of that block/proc/lambda, therefore the behavior of local variables within the context of closure seems to violate the scoping rules we have become familiar with re: local variables.
- **What are blocks used for? Give examples of specific use cases**
  - deferring implementation to the time of invocation of a method; to do this, we write methods that are general purpose and can thus specify the implementation details in our blocks/procs at the time of invocation rather than within the method's definition. This allows for more flexible code and the ability to postpone specific execution details to the time of exe.
  - alternatively, we use blocks to do sandwich operations (setup -> |block| -> teardown),
    - a 'before' and 'after' effect; we can use blocks to implement the desired functionality and we can capture some state information and compare it to some other other data or information that predated the block's execution, thus sandwiching the block.

- **How do we write methods that take a block? What errors and pitfalls can arise from this and how do we avoid them?**
  - all methods *can* take blocks, (implicit block vs explicit block passing)
  - if we invoke a method and pass a block as an argument implicitly, we **MUST** use the `yield` keyword to surrender exe control to the passed-in block. If we define a method with a `yield` but fail to pass a block to the method at the time of invocation, a `LocalJumpError` exception will be thrown.
  - if we define a method to explicitly take a block (e.g. define the method with a named parameter that references a block arg), we can use either `yield` or (via the unary `&`) invoke `call` upon the `proc`
  - depending on how we wish to implement our function, we can choose to explicitly pass a block/proc in by providing a named parameter in the method definition
  - the potential pitfalls of using the unary `&` in the method invocation and the method definition; they essentially do the opposite depending on the context (invocation || definition)
- **How do we utilize the return value of a block?**
  - we can capture the return value of the yielded-to block in the form of a variable (likely local) and use this variable reference to access the return value of the block.  Alternatively, if we are dealing with a named block (a proc object), then the same would be true with capturing the return value from the block.call invocation into a local variable.
- **How can methods that take a block pass pieces of data to that block?**
  - we can pass data to a block through parameters passed to `yield(param)` or `call(param)`; if the block is defined to take arguments, the data passed will be passed into the block execution.
  - at point of invocation, we can pass our block-taking method an argument which we can then reference in the parentheses following either `yield` or `call`; thus passing the piece of data to our supplied block.
- **What is Symbol#to_proc and how is it used?**
  - used to write shorter code, can be used to convert a method that is represented by a symbol to a proc object that is then passed to the method of the calling object, which supplies the proc a receiver
- **How do we specify a block argument explicitly?**
  - unary `&` in the method definition; passed as the last argument to a method (a must!)
- **How can we return a Proc from a method or block?**
  - have that proc object or some reference to a proc object be the last line of code evaluated within the method implementation
- **How do methods and blocks return chunks of code (closures)?**
  - if, in a method definition, we have some local variable that a proc (within the method definition) uses, then we can say that that local variable is part of the *binding* of that proc object (since it's an artifact in the lexical scope where the proc object was created), so if in the method's implementation, the last line of evaluated code is a reference to that proc object or the object itself, then it can be said that the method has returned a chunk of code (a closure).

  ********************************
  ********************************
  ********************************

- **Why is it necessary to use `block_given?` within a method that isn't explicitly defined to take a block?**
  - if the method definition includes the `yield` keyword and we don't pass that method a block to yield to, a `LocalJumpError` exception will be thrown, breaking our code.  By using `block_given?` we can prevent this exeception from being thrown by letting the specific details of the method's invocation--whether or not it was passed a block--determine how the method is implemented.  It affords flexibility in both invocation and implementation.
- **What's the relationship between the Bundler gem and a project's Gemfile?**
  - the Gemfile is where we specify the gems we are planning to use along with a source and a ruby version for the directory within which the file exists.  Bundler uses the gemfile to establish the development environment: downloading/updating gems, ensuring everything talks to everything else, as well as generating a Gemlockfile that goes into more detail re: dependancies/version/etc.
- **Are there advantages to using the unary `&` when invoking a method with a block over just creating a proc object and passing it as a normal parameter (e.g. not prefixed by `&`)?  Explore the possible trade-offs with a code example.**

- **What are the benefits of explicit blocks?**
  - when we define a method in such a way as to take a block, it allows us to reference the block (which is really a proc object at this point, the block is encapsulated by the proc object) explicitly within our method implementation

- **What is the mechanism by which proc objects retain the artifacts present in their context of origin?**

- **Can lambdas be passed implicitly?**

# blocks
- a chunk of code that can either be encapsulated by a proc object or passed as an argument to a method invocation
- one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later.
- ~ to anonymous functions; a syntactic structure (chunk) that can be passed around if encapsulated in a proc object
# closures
- retain a memory of the surrounding scope when created; retains memory of what was in scope at the time of creation
# binding
  - encapsulates the execution context at some particular place; so when we create a proc object, the binding pertaining to that context is the mechanism by which the block retains memory of its surrounding context; those references were held by the binding of the block's closure
# scope
# why/when blocks
- we would favor using a block when we are only passing it as an argument once or so; repeating this more than once would violate the DRY principle since we would be writing the same code multiple times for multiple method invocations with the same block
- blocks allow us to defer implementation details to the moment of invocation.
- they're a very 'ruby' way of implementing closures; the others (procs/method objects/lambdas) are more similar with how many other languages implement closures
- *One use case is using blocks is sandwich code. The other is to postpone the specific implementation details of a method invocation to the time of invocation.  If we define a method to yield to a supplied block, we can specify some specific implementation within the block we invoke the method with, thus granting more control to the point of invocation.  This sort of technique requires defining more general methods which can be used in a number of different ways and grants more flexible code.  Excellent examples of this are Ruby's iterators like `each`, `map`, and `select`.  All they are concerned with is, was I invoked upon a collection (e.g. something iterable) and leave the rest of the implementation details up to the block they are passed at the time of invocation.*
# blocks and variable scope
- blocks have access to the local variables initialized in the enclosing scopes to where the block exists (meaning that if we have nested blocks or something of that nature, our inner most block has access to local variables initialized in the outermost lexical scope)
- implemented through bindings
# methods using blocks/procs
- all methods can be invoked with blocks; they can all take blocks implicitly
  - if we pass a block to a method implicitly and that method's implementation contains a `yield`; the block with be evaluated/invoked (?). However, if our method's implementation contains a `yield` and we don't pass that method a block, ruby will throw a `LocalJumpError` exception
- depending on the desired behavior, we can pass a block into a method implicitly or explicitly.
# explicit block parameter
- if we want to be able to reference our block (by assigning it a name) we must convert said block to a proc object (which encapsulates the block structure).  We can easily achieve this by prepending an `&` before the parameter which while reference the block.  This `&`, prepending to a parameter name in the a method's definition ` method(...here...) ` converts the supplied block into a proc object, which is then referenced by the parameter name which was prefixed by `&`.
# return values with blocks
- can be captured by a variable if we desire
# passing blocks
- implicit vs explicit passage
# unary &
- in method definition, converts arg into a proc
- in method invocation, depending on argument type, converts arg into a basic block.  If it's supplied a symbol, calls `symbol#to_proc` upon the symbol, then converts it to a proc object, then converts it into a basic block, which is then passed into the method implementation.
# arity
- the level of strictness with which a method's parameter/argument count is enforced.  Strict arity (lambdas, methods) requires that the number of arguments used to invoke a method match the number the method/lambda was defined to take.  Lenient arity (blocks/non-lambda type procs) let things play out; they can still be used/invoked without the correct number of arguments.  If a block parameter isn't passed but it is referenced in the block/proc implementation, it simply points at `nil`
# minitest
- a testing gem that ships with the ruby core/standard libraries, (unsure of which one specifically).
# minitest v rspec
- both are ways to do testing in ruby; minitest using ruby syntax while rspec uses a (DSL) that reads like plain english.  Assert-style vs Describe-style.  Conceptually they achieve the same goal: writing tests for our code
# testing terms
# SEAT
# assertions
# packaging code
# core tools purpose
- ruby version control (rbenv), managing dependancies in a development environment (bundler/gemfile), automating common tasks (rake),
# gemfiles
- where we specify the gems we are planning to use along with a source and a ruby version for the directory within which the file exists.
# regex



# regex
| Method | Use |
| - | - |
| `String#match` | Determine if regex argument matches a string. Returns MatchData object that can be evaluated for truthiness |
| `String =~ regex` | Determine if regex argument matches a string. Returns the index of the string for the first match found, otherwise returns `nil`. |
| `String#split` | Split string by regex match |
| `String#sub` | Replace first match from calling string to given regex with given replacement string `string.sub(regex, new_str)` |
| `String#gsub` | replace _all_ matches from calling string to given reges with given replacement string `string.gsub(regex, new_str)` |
