=begin 10:10
### Problem
# Input: string
# Output: hash (containing :lowercse, :uppercase, and :neither)

# Questions:
- Numbers and spaces are considered neither?
- Always are strings?

## Rules:
# Explicit:
- String contains at least 1 character

# Implicit:
- Hash will always contain the same keys

### Data structure
# hash = {}
# string.chars.each 
- case char
  - ('A'..'Z') do
    lowercase + 1
  - ('a'..'z') do
    uppercase + 1
  - else do
    neither + 1
  end
end 10:26
=end 

def letter_percentages(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0}

  string.chars.each do |char|
    case char
    when ('a'..'z') then hash[:lowercase] += 1
    when ('A'..'Z') then hash[:uppercase] += 1
    else hash[:neither] += 1
    end
  end
  size = string.size
  hash[:lowercase] = (hash[:lowercase].to_f / size) * 100
  hash[:uppercase] = (hash[:uppercase].to_f / size) * 100
  hash[:neither] = (hash[:neither].to_f / size) * 100

  hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
