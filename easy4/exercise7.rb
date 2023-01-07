DIGITS = {
  '0': 0,
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9
}

def string_to_integer(s)
  
  s.each_byte { |c| int << c - 48 }
  int
end

p string_to_integer('4321')
p string_to_integer('570')

