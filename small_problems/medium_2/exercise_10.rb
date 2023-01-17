def operator_recurse(n, operator)
  return 1 if n <= 1
  return n + operator_recurse(n - 1, operator) if operator == '+'
  return n ** 2 + operator_recurse(n - 1, operator) if operator == '**'
end

def sum_square_difference(n)
  operator_recurse(n, '+')**2 - operator_recurse(n, '**')
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150