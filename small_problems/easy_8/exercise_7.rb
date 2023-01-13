def double_consonants(s)
  new_s = ''
  s.each_char do |char|
    if char =~ /[a-z]/i && char =~ /[^aeiou]/i
      new_s << char * 2
    else
      new_s << char 
    end
  end
  new_s
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""