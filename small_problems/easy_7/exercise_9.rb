def multiply_all_pairs(arr1, arr2)
  arr = []
  arr1.each do |arr1_num|
    arr2.each { |arr2_num| arr << arr1_num * arr2_num }
  end

  arr.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]