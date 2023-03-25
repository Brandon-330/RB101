def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(digit, slice)
  arr = digit.to_s.split('')
  arr[-slice..-1] = rotate_array(arr[-slice..-1])
  arr.join('').to_i
end

def max_rotation(digit)
  counter = 0
  size = digit.to_s.split('').size
  while counter < size - 1 #To not take into account the unecessary last rotation
    digit = rotate_rightmost_digits(digit, size - counter)
    counter += 1
  end

  digit
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845