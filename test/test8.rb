=begin 9:52
### Problem
# Input: string
# Output: bool

## Rules:
# Explicit:
Return false
- If string contains both letters in one block
- Each block's both letters can only be used once
Return true
- If string does not contain letters from sme block

# Implicit:
- Case insensitive

### Data structure
Nested array, containing all the block with letters in them
Iterate through sub-array
#any? method for outer array (to determine a single true)
- #all? method each sub-array
--- #include? method inside #all?
=end

def block_word?(string)
  arr = [['B', 'O'],
  ['X', 'K'],
  ['D', 'Q'],
  ['C', 'P'],
  ['N', 'A'],
  ['G', 'T'],
  ['R', 'E'],
  ['F', 'S'],
  ['J', 'W'],
  ['H', 'U'],
  ['V', 'I'],
  ['L', 'Y'],
  ['Z', 'M']]

  !arr.any? do |sub_arr|
    sub_arr.all? do |el|
      string.upcase.include?(el)
    end
  end
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true