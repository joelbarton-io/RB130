# refresher
- local variables look like method invocations sometimes
- always be aware of where a local variable is initialized; this determines its scope!

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III" # re-assigning `name` after initialization on line 10

call_me(chunk_of_code)
```
# closure & binding
- `Proc` objects are closures, meaning they remember the entire context within which they were created/instantiated and can reference l-vs/values

- blocks are how Ruby implements closures (chunk of code that is passed around/executed some later time). This chunk of code is represented by a `Proc` object, a `lambda`, or a block!
- the surrounding context of the chunk of code is called its (the chunk's) **binding**
- "artifacts" : method references, constants, local variables, etc...
