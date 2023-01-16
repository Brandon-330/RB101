def fibonacci(n)
  arr = Array(1..n)

  arr.each_with_index do |el, ind|
    if el <= 2
      arr[ind] = 1
    else
      arr[ind] = arr[ind - 2] + arr[ind - 1]
    end
  end
  p arr[-1]
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501