def palindrome?(s)
  s.reverse == s
end

puts palindrome?('madam')
puts palindrome?('Madam')
puts palindrome?("madam i'm adam")
puts palindrome?('356653')