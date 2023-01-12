words = "the flintstones rock"

words = words.split.map! { |value| value.capitalize }.join(' ')
p words