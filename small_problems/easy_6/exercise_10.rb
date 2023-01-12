array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Because we are using array values to mutate array2,
# When we also mutate array1 with upcase!, we are directly impacting
# array 2 as well, since the value now POINTS to array2