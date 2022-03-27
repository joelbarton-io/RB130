# --------------------------------1------------------------------------------- #
## Without running the code, predict the output of the method invocations. Is this behavior suprising?  What does it tell us about block parameters?

def a_method
  yield([1,3,5])
end

a_method { |a| puts a }
a_method { |a, b| puts a + b }

# --------------------------------2------------------------------------------- #
## 2. Write all of the various ways by which we can create a Proc object.


# --------------------------------3------------------------------------------- #
## Will the below code throw an exception?  Is this suprising?  What does this tell us about the unary &?

def a_method(var, &block)
  proc &block
end

var = "I'm in a block! "
my_proc = a_method(var) { |el| p var * el }
my_proc[3]

# -------------------------------------4-------------------------------------- #
## What is output to the screen by the below code?  Extra credit: what name bindings are held by the proc object returned by the `math_operation` method?

def math_operation(n)
  m = 3
  lambda { |l| l + m + n }
end

square = math_operation(2)

var = 10
p square.call(var)

# -----------------------------------5---------------------------------------- #
## What core computer science concept affords us the ability to both reference and access the value of a local variable initialized within the scope of a method *after* a method has finished executing? Demonstrate this core concept with a code example and annotations (#comments).


# -----------------------------------6---------------------------------------- #
## Without executing the below code, predict what will be output to the screen by invoking `main_method`.

def main_method(a_proc)
  inner_proc = proc { |el| el }
  second_method(a_proc.call(inner_proc))
end

def second_method(arg)
  'Hey! ' * arg
end

some_var = 3
outer_proc = proc { |arg| arg.call(some_var) }
some_var = 5

p main_method(outer_proc)

# -----------------------------------7---------------------------------------- #
## Can a lambda be passed implicitly?

# -----------------------------------8---------------------------------------- #
## What's the point of using a proc object?  What's the benefit over just using a normal method?  What's the benefit of encapsulating a block in a proc object?

# -----------------------------------9---------------------------------------- #
## Describe in detail the symbol -> proc shortcut demonstrated below (very open-ended).

[1, 2, 3].map(&:to_s)


# ----------------------------------10---------------------------------------- #
## What is the output of the below code?  Describe the process of the last line in detail.

arr = [1, 2, 3]
add_one = proc { |num| num + 1 }
p arr.map(&add_one)


# ----------------------------------10---------------------------------------- #
## Why are blocks useful?  What benefits do they grant us? (very open-ended)


# ----------------------------------11---------------------------------------- #
## Are there advantages to using the unary `&` when invoking a method with a block over just creating a proc object and passing it as a normal parameter (e.g. not prefixed by `&`)?  Explore the possible trade-off(s) with a code example.


# ----------------------------------12---------------------------------------- #
## What's the relationship between the Bundler gem and a project's Gemfile?