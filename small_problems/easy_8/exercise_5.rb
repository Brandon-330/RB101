def fizzbuzz(n1, n2)
  (1..15).each do |num|
    case
    when num % 15 == 0
      print 'FizzBuzz'
    when num % 3 == 0
      print 'Fizz'
    when num % 5 == 0
      print 'Buzz'
    else
      print num
    end
    print ', ' unless num == n2
    puts '' if num == n2
  end
end

fizzbuzz(1, 15)