def transpose(arr)
  counter = 0
  transposed = []
  arr.each do |inner_arr|
    while counter < inner_arr.size
      temp = []
      (arr.size).times do |ind|
        temp << arr[ind][counter]
      end
      counter += 1
      transposed << temp
    end
  end
  transposed
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]