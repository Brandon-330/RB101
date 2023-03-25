=begin
19 27
### Problem
# Input: String
# Output: Character least often

## Rules
# Explicit:
- case insensitive
- Spaces and punctuation count

### Data Structure
# #lowercase original array
# #chars #each to use each value of array
# original string #count (given char)
# if frequency < lowest
# lowest = given char
=end

def least_common_char(string)
  string = string.downcase
  lowest_char = string[0]
  lowest_freq = string.count(lowest_char)
  string.chars.each do |char|
    freq = string.count(char)
    if freq < lowest_freq
      lowest_char = char
      lowest_freq = freq
    end
  end
  
  lowest_char
end

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA")