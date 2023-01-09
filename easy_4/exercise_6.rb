def running_total(arr)
  new_arr = []
  for i in (0...arr.size) do
    if i >= 1
      new_arr.push(arr[i] + new_arr[i - 1])
    else
      new_arr.push(arr[i])
    end
  end
  return new_arr
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])