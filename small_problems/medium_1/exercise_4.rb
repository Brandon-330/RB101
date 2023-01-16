# input: array of numbers
# output: array of numbers
# rules:
#   first iteration: return all numbers (.select?)
#   second iteration: switch all switches in multiples of 2
#   third iteration: switch all switches in multiples of 3

# things to note:
#   will never flip first switch after first iteration
#   first iteration can be considered our base case
#   .map would be really helpful, and at the last iteration, return with .select

# To make this work, we can picture each switch having a boolean value.
# However, we want the boolean value to return its number as well,
# so a true or false with index works, but it will require more work.
# So why don't we work with negatives instead? It will give us -
# the number of interest and a bool value with the negative sign!
def switches(n)
  original_arr = Array(1..n)
  # Iterated array will start with all lights off (negative)
  iterated_arr = original_arr.map { |el| -el }

  # Each iteration through array gives us the "round" # of interest
  original_arr.each do |number|
    iterated_arr = iterated_arr.map do |el_thru_iterated_arr|
      # If iterated array is a multiple of the round #, flip signs
      el_thru_iterated_arr % number == 0 ? -el_thru_iterated_arr : el_thru_iterated_arr
    end
  end
  # Select only positive switches
  iterated_arr.select { |el| el > 0 }
end

p switches(1) == [1]
p switches(5) == [1, 4]
p switches(10) == [1, 4, 9]