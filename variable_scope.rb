#1
x = 4

loop do
  x = 'hey there'
  break
end

puts x  # => what’s x? this should put 'hey there'

#2

def no_mutate(arr)
  arr.uniq
end

my_arr = [1, 2, 2, 3]
no_mutate(my_arr)
puts my_arr # => what’s the output? this will out put 1 2 2 3 it's not a destructive method so the variable doesn't change

#3
def yes_mutate(arr)
  arr.uniq!
end

my_arr = [1, 2, 2, 3]
yes_mutate(my_arr)
puts my_arr # => what’s the output? output is 1 2 3 uniq! is destructive and mutates the variable

#4
x = "hi"

def my_method
  puts x
end

my_method # => what’s the output of invoking the "my_method" method? I thought it would put "hi" but it didn't since the variable did not get passed to that method. Should have raed the hint!!
