=begin
19
### Problem
# Input: String
# Output: String (a character)

## Rules
# Explicit:
- Return least often character in given string
- Return first in string if multiple
- Case insensitive

# Implicit:
- Only strings
- Always greater than ''

### Data Structure
# str #downcase
# freq = [str[0], 
# str #chars #each do |char|
# if str #downcase #count(char)
# freq
=end

def least_common_char(str)
  str = str.downcase
  least_freq_char = [str[0], str.count(str[0])]
  str.chars.each do |char|
    least_freq_char = [char, str.count(char)] if str.count(char) < least_freq_char[1]
  end

  least_freq_char[0]
end

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'