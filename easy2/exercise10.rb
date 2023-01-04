def negative(n)
    return -n if n > 0
    return n
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0