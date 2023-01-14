arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map! do |inner_arr|
  inner_arr.sort.reverse
end

p arr