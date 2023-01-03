print "What is your age? "
age = gets.chomp.to_i

print "At what age woudl you like to retire? "
retirement = gets.chomp.to_i

time = Time.now.year
remainder = retirement - age

puts "It's 2023. You will retire in #{time + remainder}."
puts "You have only #{remainder} years of work to go!"