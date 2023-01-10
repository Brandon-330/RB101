def show_multiplicative_average(arr)
  return format('%.3f', arr[0].to_f) if arr.size == 1
  
  sum = 1
  arr.each { |x| sum *= x.to_f }
  format('%.3f', sum / arr.size)
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667