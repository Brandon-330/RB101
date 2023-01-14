arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_arr = arr.map do |inner_arr|
  inner_arr.select { |x| x % 3 == 0 }
end

p new_arr