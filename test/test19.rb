# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') ==  'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') == 'fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'

=begin
### Problem
# Input: String (of lowercase characters)
# Output: String (substring)

## Rules
# Explicit:
- return the longest substring in alphabetical order
- Passed in string will contain at least one character 

# Implicit:
- All given Objects are strings

### Data Structure
# Determine all the substrings in the given string
  - while loop
  - iterate over the starting index (counter for index)
  - size of the sub_string
  - Return it all to a new array if Sub_string == sub_string.sort, put this in new array
# max counter on the outside = ['', 0]
# iterate over the new array
  - max_counter = [sub_string, sub_string.size] if sub_strings #size in new array > max_counter[1]
=end

def longest(str)
  new_arr = []
  ind = 0
  while ind < str.size
    sub_string_size = 1
    while ind + sub_string_size <= str.size # 'a' [0,1] => 'a'
      sub_string = str[ind, sub_string_size]
      new_arr << sub_string if sub_string == sub_string.chars.sort.join('')
      sub_string_size += 1
    end
    ind += 1
  end

  longest_sub_string = ''
  new_arr.each do |sub_string|
    longest_sub_string = sub_string if sub_string.size > longest_sub_string.size
  end

  longest_sub_string
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'