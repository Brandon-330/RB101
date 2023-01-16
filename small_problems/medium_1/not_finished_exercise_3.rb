def rotate_array(arr)
  new_arr = arr.dup
  new_arr << new_arr.shift
end

def rotate_rightmost_digits(digits, n)
  digits_arr = digits.to_s.split('')
  digits_arr += rotate_array(digits_arr.pop(n))
  digits_arr.join.to_i
end

def max_rotation(digits)
4.times do |count|
    digits = rotate_rightmost_digits(digits, count + 1)
  end
  p digits
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845