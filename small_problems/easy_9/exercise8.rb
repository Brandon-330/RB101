def buy_fruit(arr)
  new_arr = []
  arr.each { |arr| arr[1].times { new_arr << arr[0] }}
  p new_arr
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]