=begin
31
### Problem
# Input: String
# Output: Hash

## Rules
# Explicit:
- String alaways contain 1 character
- Will always return a hash of similar structure

### Data Structure
# Hash.new(0.0)
# arr = [0, 0, 0]
# str.chars.each do |char|
  - case char
    /[a-z]/ then arr[0] += 1
    //
=end

def letter_percentages(str)
  capital_hash = Hash.new(0.0)
  arr = [0, 0, 0]
  str.chars.each do |char|
    case char
    when /[a-z]/ then arr[0] += 1
    when /[A-Z]/ then arr[1] += 1
    else arr[2] += 1
    end
  end

  capital_hash[:lowercase] = (arr[0].to_f / str.size) * 100
  capital_hash[:uppercase] = (arr[1].to_f / str.size) * 100
  capital_hash[:neither] = (arr[2].to_f / str.size) * 100

  capital_hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }