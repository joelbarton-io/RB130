# frozen string literal

# require 'pry'

# factorial
# def fn(n, proc_obj)
#   return n if n <= 1
#   n * fn(proc_obj.call(n), proc_obj)
# end

# lamb = lambda { |arg| arg - 1 }

# p fn(5, lamb)

# def fn(n, total = 0)
#   return total if n <= 0
#   fn(n - 1, total + n)
# end

# p fn(9)

=begin

fn(3, 0)
  fn(2, 3)
    fn(1, 5)
      fn(0, 6)
      returns 6
    6
  6
6

=end

# find the 9th fibonacci number
#
# def fib_rec(n)
#   return 1 if n == 1 || n == 2
#   fib_rec(n - 1) + fib_rec(n - 2)
# end
# p fib_rec()
=begin

=end
