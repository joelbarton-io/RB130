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

- **What are closures?**
  - *"a technique for implementing lexically scoped name binding"*
  - *"a piece of code that carries its creation context around with it"*

  - implemented through the use of blocks and proc objects
    - a local variable must be initialized before the block/proc for it to be part of the block/proc's binding
    - on the other hand, methods (and their names) can be declared after a block chunk and will be part of the binding (unless they are defined below where the block/proc is used)
- **What are blocks?**
  - a syntactic structure that we can pass to methods as an argument or store as part of a proc object's state
- **What are Procs and lambdas? How are they different?**
- **How do closures interact with variable scope?**
- **What are blocks used for? Give examples of specific use cases**
- **How do we write methods that take a block? What erros and pitfalls can arise from this and how do we avoid them?**
- **How do we utilize the return value of a block? How can methods that take a block pass pieces of data to that block?**
- **What is Symbol#to_proc and how is it used?**
- **How do we specific a block argument explicitly?**
- **How can we return a Proc from a method or block?**
- **What is arity? What kinds of things in Ruby exhibit arity? Give explicit examples.**
- **How do methods and blocks return chunks of code (closures)?**

- **Why is it necessary to use `block_given?` within a method that isn't explicitly
  defined to take a block?**
- **What's the relationship between Bundler and a Gemfile?**

# blocks
# closures
# binding
# scope
# why/when blocks
# blocks and variable scope
# methods using blocks/procs
# explicit block parameter
# return values with blocks
# passing blocks
# unary &
# arity
# minitest
# minitest v rspec
# testing terms
# SEAT
# assertions
# packaging code
# core tools purpose
# gemfiles
# regex





# regex
| Method | Use |
| - | - |
| `String#match` | Determine if regex argument matches a string. Returns MatchData object that can be evaluated for truthiness |
| `String =~ regex` | Determine if regex argument matches a string. Returns the index of the string for the first match found, otherwise returns `nil`. |
| `String#split` | Split string by regex match |
| `String#sub` | Replace first match from calling string to given regex with given replacement string `string.sub(regex, new_str)` |
| `String#gsub` | replace _all_ matches from calling string to given reges with given replacement string `string.gsub(regex, new_str)` |