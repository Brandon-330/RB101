=begin
### Problem
input: integer
output: integer

## rules:
# explicit:
return next featured number after given number
featured number consists of
- odd number
- AND multiple of 7
- AND digit must occur once, not twice

### Data structure
# array to iterate through all the numbers and make sure it is uniq
arr.uniq.size == arr.size

# To determine multiple of 7, % 7 == 0, if not number, then minus remainder + 7 until odd
=end

def featured(n)
  arr = n.to_s.split('')
  loop do
    return "There is no possible number that fulfills those requirements" if arr.size > 10
    if n.odd?
      n = n - (n % 7) + 14
    else
      n = n - (n % 7) + 7
    end
    arr = n.to_s.split('')
    break if arr.uniq == arr && n.odd? && n % 7 == 0
  end
  n
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

#featured(9_999_999_999) # -> There is no possible number that fulfills those requirements