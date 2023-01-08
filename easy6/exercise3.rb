def fibonacci(arr)
  arr << (arr[-1] + arr[-2])
end

def find_fibonacci_index_by_length(n)
  arr = [1, 1]
  index = 2
  while n > arr[-1].to_s.size
    index += 1
    arr = fibonacci(arr)
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847