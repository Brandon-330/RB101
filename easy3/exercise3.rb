print "Please write word or multiple words: "
words = gets.chomp
arr = words.delete(" ").split("")
puts "There are #{arr.size} characters in \"#{words}\"."