def merge(arr1, arr2)
  merged_arr = []
  while !arr1.empty? || !arr2.empty? do
    if arr1.empty?
      merged_arr << arr2.map { |el| el }
      arr2 = []
    elsif arr2.empty?
      merged_arr << arr1.map { |el| el }
      arr1 = []
    elsif (arr1 <=> arr2) == -1
      merged_arr << arr1[0]
      arr1 = arr1[1..-1]
    elsif (arr1 <=> arr2) == 1
      merged_arr << arr2[0]
      arr2 = arr2[1..-1]
    end
  end
  merged_arr.flatten
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]