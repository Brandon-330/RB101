statement = "The Flintstones Rock"

hash = Hash.new(0)
statement.each_char do |char|
  hash[char] += 1 if !!char.match(/[a-zA-Z]/)
end
p hash