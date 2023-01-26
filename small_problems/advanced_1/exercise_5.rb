# arr[-1][0]... -> arr[-3][0]
# arr[-1][1]

def rotate90(arr)
  counter = 0
  rotated = []
  number_of_rows = arr.size
  number_of_columns = arr[0].size
  (0...number_of_columns).each do |column_ind|
    temp = []
    (0...number_of_rows).each do |row_ind|
      temp << arr[-(row_ind + 1)][column_ind]
    end
    rotated << temp
  end
  p rotated
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2