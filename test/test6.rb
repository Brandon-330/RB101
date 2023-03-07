=begin
### Problem
input: array
output: array of same object

questions:
are all the arrays going to include the same objects inside of them?

rules:
select one number and evaluate it through the array, switching the numbers

### data structure
# while loop until swap? = false
# iterate through array
# each_with_index iteration to determine the st
=end

def bubble_sort!(array)
  loop do
    swap = false
    array.each_with_index do |el, ind|
      if ind >= 1
        if el < array[ind - 1]
          temp = el
          array[ind] = array[ind - 1]
          array[ind - 1] = temp
          swap = true
        end
      end
    end
    break unless swap
  end
  p array
end

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)