def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number
    divisor -= 1
  end
  factors
end