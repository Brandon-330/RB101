# def select_fruit(hash)
#   new_hash = hash.select { |k, v| k if v == "Fruit" }
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p select_fruit(produce)

# input: arr of integers
# output: arr of integers doubled
# rules:
#   same sequence & length

# def double_numbers!(arr)
#   counter = 0
#   loop do
#     break if counter == arr.size
#     arr << arr.shift * 2
#     counter += 1
#     p arr
#   end
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]

# input: arr of integers
# output: arr of integers
# rules:
  # Same length array returned
  # modifid number based on if odd indices
double_odd_numbers(arr)