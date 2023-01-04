print "What is your name? "
name = gets.chomp

if name[-1] != "!"
  puts "Hello #{name}."
else
  name.chop!.upcase!
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
end