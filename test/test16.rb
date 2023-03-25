=begin
04
### Problem
# Input: Integer
# Output: Integer

## Rules
# Explicit:
- Return the next featured number
  - an odd number
  - multiple of 7
  - all digits must occur exactly once each

### Data Structure
# # counter starts at given number
# while counter.to_s.size <= 10
  counter += 1
  return counter if counter.odd? && counter % 7 == 0 && digits_occur_once?(counter)
end

# digits_occur_once?(n)
  - n#to_s#chars #all? { |char| n.to_s.count}

=end

def featured(n)
  counter = n + 1
  while counter.to_s.size <= 10
    return counter if counter.odd? && counter % 7 == 0 && digits_occur_once?(counter)
    if counter % 7 == 0 && counter.odd?
      counter += 14
    elsif counter.odd?
      counter += 2
    elsif counter % 7 == 0
      counter += 7
    else
      counter += 1
    end
  end

  "There is no possible number that fulfills these requirements"
end

def digits_occur_once?(n)
  n.to_s.chars.all? { |char| n.to_s.count(char) == 1 }
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements