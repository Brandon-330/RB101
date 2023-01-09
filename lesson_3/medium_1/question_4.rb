def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# There are two cautions here
# Rolling buffer1 takes already a given array and mutates it
# forever outside of method variable scope. The second method
# Does not mutate the argument, and will present as a better way
# to change the variable and returning an updated one inside scope