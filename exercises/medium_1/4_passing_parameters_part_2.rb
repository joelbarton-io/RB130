
def a_method(arr)
  yield(arr.last(2))
end
birds = %w(raven finch hawk eagle)
raptors = a_method(birds) { |raptors| raptors }
p raptors

# def a_method(arr)
#   yield(arr)
# end

# birds = %w(raven finch hawk eagle)

# p a_method(birds) { |_, _, *raptors| "Raptors: #{raptors.join(', ')}" }

