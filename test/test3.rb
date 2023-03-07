def double(num)
  num = num * 2 # => * method does not mutate original object
end

int = 2
double(int)

puts int #=> still 2