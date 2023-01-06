def real_palindrome?(s)
  s = s.downcase.match(/[[:alnum:]]+/)
  s[0].reverse == s[0]
end

puts real_palindrome?('madam')
puts real_palindrome?('Madam')
puts real_palindrome?("madam i'm adam")
puts real_palindrome?('356653')
puts real_palindrome?('356a653')
puts real_palindrome?('123ab321')