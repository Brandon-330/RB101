def repeater(s)
  new_s = ''
  s.each_char { |char| new_s << char * 2}
  new_s
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''