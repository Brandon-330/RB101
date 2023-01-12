def multiply_list(arr1, arr2)
  new_arr = []
  for i in (0...arr1.size)
    new_arr.push(arr1[i] * arr2[i])
  end
  new_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]