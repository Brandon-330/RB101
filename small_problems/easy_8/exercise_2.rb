def leading_substrings(s)
  counter = 1
  arr = []
  while s.size >= counter
    arr << s[0, counter]
    counter += 1
  end
  arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
