def featured(n)
  next_number = n + 7 - (n % 7)
  
  loop do
    if next_number.odd?
      arr = next_number.to_s.split('')
      bool = arr.all? do |num|
        arr.count(num) == 1
      end
      return next_number if bool
    end
    
    break if next_number >= 9_876_543_210
    next_number += 7
  end
  'There is no possible number that fulfills those requirements.'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) #== 1029
p featured(1029) == 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements