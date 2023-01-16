def rotate_array(arr)
  new_arr = arr.dup
  new_arr << new_arr.shift
end

def rotate_rightmost_digits(digits, n)
  digits_arr = digits.to_s.split('')
  digits_arr += rotate_array(digits_arr.pop(n))
  digits_arr.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917