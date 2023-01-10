def interleave(arr1, arr2)
  new_arr = []
  arr1.size.times do |ind| 
    new_arr << arr1[ind] << arr2[ind]
  end
  new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']