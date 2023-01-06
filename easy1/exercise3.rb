def stringy(n)
  arr = []
  one = true
  n.times do
    if one == true
      arr << "1"
      one = false
    else
      arr << "0"
      one = true
    end
  end
  return arr.join("")
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'