hexadecimal_hash = {
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
  10 => 'a',
  11 => 'b',
  12 => 'c',
  13 => 'd',
  14 => 'e',
  15 => 'f'
}

new_s = ''

8.times { new_s << hexadecimal_hash[rand(1..15)] }
new_s += '-'
4.times { new_s << hexadecimal_hash[rand(1..15)] }
new_s += '-'
4.times { new_s << hexadecimal_hash[rand(1..15)] }
new_s += '-'
4.times { new_s << hexadecimal_hash[rand(1..15)] }
new_s += '-'
12.times { new_s << hexadecimal_hash[rand(1..15)] }
p new_s
