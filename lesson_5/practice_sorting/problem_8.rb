hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |string|
    string.each_char do |char|
      puts char if char =~ /[aeiou]/i
    end
  end
end
