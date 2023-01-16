def rotate_array(arr, n)
  new_arr = arr.dup
  new_arr << new_arr.shift(n).join
end

def rotate_rightmost_digits(digits, n)
  rotated_arr = rotate_array(digits.to_s.split(''), n)
  p rotated_arr.map(&:to_i).join
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917