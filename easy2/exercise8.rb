def recurse(n, s)
  if n == 1
    return 1
  end

  if s == 's'
    return n + recurse(n - 1, s)
  elsif s == 'p'
    return n * recurse(n - 1, s)
  end
end

puts "Please enter an integer greater than 0:"
num = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
string = gets.chomp

puts "The sum of the integers between 1 and #{num} is #{recurse(num, string)}." if string == 's'
puts "The product of the integers between 1 and #{num} is #{recurse(num, string)}." if string == 'p'
