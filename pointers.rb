a = 'hi there'
b = a
a.gsub!(' ', '_')
puts b # => what’s the output? since gsub! is destructive b = hi_there


#next question
a = 'hi there'
b = a
a = [1, 2, 3]
puts b # => what’s the output? the output is "hi there" the array assignment is not a pointer so be is still hi there
#the difference is the that gsub! mutates the caller and those affects any variables that were assigned that variable
