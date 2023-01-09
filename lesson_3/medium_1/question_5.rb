def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    p sum
    first_num = second_num
    second_num = sum
  end
  sum = first_num + second_num
end

result = fib(0, 1)
puts "result is #{result}"