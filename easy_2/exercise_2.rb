puts "Enter the length of the room in meters: "
length = gets.chomp.to_f

puts "Enter the width of the room in meters: "
width = gets.chomp.to_f

puts "The area of the room is #{(length * width).round(2)} square meters (#{(length * width * 10.7639).round(2)} square feet)."