def merge(arr1, arr2)
  merged_arr = []
  arr1.each do |el_arr1|
    arr2.each do |el_arr2|
      if el_arr1 < el_arr2
        merged_arr << el_arr1
        break
      else
        merged_arr << el_arr2
      end
    end
  end
  p merged_arr
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]