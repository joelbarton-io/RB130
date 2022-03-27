1. What is a closure? How does it interact with the artifacts found in its surrounding?
2. Describe what is happening in the following code in reference to closures and binding

    ```ruby
    def for_each_in(arr)
    	arr.each { |element} yield(element) }
    end

    arr = ['a', 'b', 'c', 'd']
    results = ['']

    for_each_in(arr) do |char|
    	total = results[-1] + char
    	results.push(total)
    end

    p results
    # => what is the output
    ```

3. What are the ways we can implement closures in ruby?
4. What is the difference between a `Proc` and a block? `Proc` and lambdas?
5. Describe what is happening in the following code

```ruby
def alphabet
	counter = -1
	letters = ('a'..'z').to_a

	Proc.new do
		counter += 1
		letter[counter]
	end
end

# What is returned by the method?

alpha1 = alphabet
p alpha1 # output?

alpha1.call
alpha1.call

alpha2 = alphabet
p alpha2

alpha2.call
alpha2.call
alpha1.call
```

6. How does a closures binding violate the scoping rules of a local variable? give example
7. What is the output of the following code and why?

```ruby
def introduction(name)
	name.call
end

title = "Mr. john"

display = Proc.new { puts "Hi my name is #{title}" }

title = "Sir John"

introduction(display)

```

8. How does an implicit block affect the return value or output of a method call? Give examples
9. What are the benefits of using a block that takes an argument? Give an example
10. What happens when we pass a block the wrong number of arguments? What is this called?
11. Describe what is happening in the code below and the output/return value

```ruby
def before_and_after(obj)
  puts "Before: #{obj}"
  after = yield(obj)
  puts "After: #{after}"
end

before_and_after(0) { |num| num + 5 }

before_and_after('good morning') { |greeting| greeting + "!!" }
```

12. Describe what is happening in the code below

```ruby
def select_elements(array)
  results = []
  counter = 0
  while counter < array.size
    current_element = array[counter]

    results << current_element if yield(current_element)
    counter += 1
  end
  results
end

select_elements(%w(a B C d e F)) { |letter| letter =~ /[A-Z]/ }
# output?

select_elements([1, 2, 3, 4]) { |num| num.odd? }
#  output?
```

13. What happens in the code below and how can we improve the code to get our expected result?

```ruby
def yield_to_block
	puts "I want to yield to a block. Can I yield to a block? "
	yield
	puts "Great! I got the expected result."
end

yield_to_block

# expected result
# "I want to yield to a block. Can I yield to a block?
# Yes! A block was given during method invocation.
# Great! I got the expected result.
```

14. What are the two uses cases for blocks?