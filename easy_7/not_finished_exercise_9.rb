def multiply_all_pairs(arr1, arr2)
  return_arr = []
  dummy_arr = arr1 + arr2
  dummy_arr.each { |x| dummy_arr[0] * }

  p new_arr
  #.uniq.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]