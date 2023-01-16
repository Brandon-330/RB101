def halvsies (arr)
  arr.partition.with_index do |_, ind|
    arr.size.odd? ? ind <= arr.size/2 : ind < arr.size/2
  end
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]