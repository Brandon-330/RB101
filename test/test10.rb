=begin 10:28
### Problem
# Input: string
# Output: bool

## Rules
# Explicit:
- ( parantheses must have a ) paranthesis after it

# Implicit:
- You can have double ((, as long as there is )) after it
- Cannot have just 1 (, or )

### Data structure
# Iterate through each character of string
- Make a ( counter, if it ever drops below 0, it will have more ) than (
  - If so, return false early
- At the end of iteration, counter must be equal to 0, or false (ternary expression)
10:37
=end 

def balanced?(string)
  parantheses_counter = 0
  string.chars.each do |char|
    case char
    when '(' then parantheses_counter += 1
    when ')' then parantheses_counter -= 1
    end
    return false if parantheses_counter < 0
  end
  parantheses_counter == 0 ? true : false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false