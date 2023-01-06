def triangle(n)
  puts ""
  spaces = n
  n.times do
    spaces -= 1
    remainder = n - spaces
    puts " " * spaces + "*" * remainder
  end
end

triangle(5)