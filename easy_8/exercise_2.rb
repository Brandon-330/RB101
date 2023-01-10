def leading_substrings(s)
  new_arr = []
  while s.size > 0
    new_arr.push(s)
    s.chop!
  end
  p new_arr 
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
