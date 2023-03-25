=begin
10
### Problem
# Input: String
# Output: Bool

## Rules
# Explicit:
- '(' must match the number of ')'
- There must be a ')' after a '('
- There must be a '(' before a ')'
- counter 

=end

def balanced?(str)
  parantheses_counter = 0
  str.chars.each do |char|
    case char
    when '(' then parantheses_counter += 1
    when ')' then parantheses_counter -= 1
    end

    return false if parantheses_counter < 0
  end

  str.count('(') == str.count(')') ? true : false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
