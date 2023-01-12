flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
flintstones.each.with_index { |value, ind| hash[value] = ind }

p hash

