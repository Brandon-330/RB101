def bubble_sort!(arr)
  swapped = true
  while swapped == true
    swapped = false

    arr.each_with_index do |el, ind|
      if el == arr[0]
        if el > arr[1]
          arr[0], arr[1] = arr[1], el
          swapped = true
        end
      elsif arr[ind - 1] > el
        arr[ind], arr[ind - 1] = arr[ind - 1], el
        swapped = true
      end
    end
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)