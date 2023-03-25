=begin
28 43
### Problem
# Input: Array (of integers)
# Output: Array (with 2 integers)

## Questions
- Will the array always have 2 or more integers?
- Will it always be integer elements?

## Rules
# Explicit:
- The output must have the two closest numbers together in value

### Data Structure
# lowest_difference = ((arr[0] + arr[1]) / 2) - arr[0]
# output = [arr[0], arr[1]]
# #each_with_index the original array
  - #each_with_index the original array again
    - if ind1 != ind2
        if ((el1 + el2) / 2) - el1 < lowest_difference
          lowest_difference = ((el1 + el2) / 2) - el1
          #condition here => output = [el1, el2]
        end
      end
    end
  end
end
=end

def closest_numbers(arr)
  lowest_diff = ((arr[0] + arr[1])/ 2) - arr[0]
  output = [arr[0], arr[1]]
  arr.each_with_index do |el1, ind1|
    arr.each_with_index do |el2, ind2|
      if ind1 != ind2
        if (((el1 + el2) / 2) - el1).abs < lowest_diff
          lowest_diff = (((el1 + el2) / 2) - el1).abs
          output = [el1, el2]
        end
      end
    end
  end

  arr.select { |num| num == output[0] || num == output[1] }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]