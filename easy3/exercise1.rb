arr = []
index = 1

6.times do
  place = index.to_s + "st" if index == 1
  place = index.to_s + "nd" if index == 2
  place = index.to_s + "rd" if index == 3
  place = index.to_s + "th" if index > 3
  place = "last" if index == 6 
  
  puts "==> Enter the #{place} number: "
  arr << gets.chomp.to_i
  index += 1
end

num = arr[-1]
arr.pop

bool = false
arr.each { |x| bool = true if x == num }

puts bool ? "The number #{num} appears in #{arr}." : "The number #{num} does not appear in #{arr}."
