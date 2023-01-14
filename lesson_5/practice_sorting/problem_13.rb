arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
arr.map do |inner_arr|
  inner_arr.sort_by do |elements|
    elements.odd
  end
end