def crunch(s)
  new_s = ''
  s.chars.map.with_index do |char, index|
    new_s << char if char != s[index - 1] || index == 0
  end
  new_s
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''