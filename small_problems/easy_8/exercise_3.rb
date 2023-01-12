def leading_substrings(s)
  counter = 1
  arr = []
  while s.size >= counter
    arr << s[0, counter]
    counter += 1
  end
  arr
end

def substrings(s)
  counter = 0
  new_arr = []
  while s.size >= counter
    new_arr += leading_substrings(s[counter, s.size - counter])
    counter += 1
  end
  p new_arr
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]