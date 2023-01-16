def sum(n)
  arr = n.to_s.split('')
  arr.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45