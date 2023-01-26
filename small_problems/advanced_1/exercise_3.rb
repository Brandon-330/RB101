matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(arr)
  counter = 0
  arr.map do |inner_arr| 
    temp = []
    3.times do |ind|
      temp << arr[ind][counter]
    end
    counter += 1
    temp
  end
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]