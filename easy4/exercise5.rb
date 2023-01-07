def sum_multiples_recurse(number_of_multiples, n)
  if number_of_multiples == 0
    return 0
  end
  return number_of_multiples * n + sum_multiples_recurse(number_of_multiples - 1, n)
end

# Since there is an or statement, we must add multiples of 3 and 5 -
# BUT NOT double count with multiples of 15
def multisum(n)
  number_of_3_multiples = n / 3 
  number_of_5_multiples = n / 5
  number_of_15_multiples = n / 15
  sum_of_3s = sum_multiples_recurse(number_of_3_multiples, 3)
  sum_of_5s = sum_multiples_recurse(number_of_5_multiples, 5)
  sum_of_15s = sum_multiples_recurse(number_of_15_multiples, 15)
  return sum_of_3s + sum_of_5s - sum_of_15s
end


p multisum(3)
p multisum(5)
p multisum(10)
p multisum(100)
p multisum(1000)