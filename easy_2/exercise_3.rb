print "What is the bill? "
bill = gets.chomp.to_f

print "what is the tip percentage? "
percentage = gets.chomp.to_f / 100
tip = bill * percentage

puts "The tip is $#{tip.round(2)}"
puts "The total is $#{(bill + tip).round(2)}"