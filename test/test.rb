def string_length(sentence)
    strings = sentence.split

    strings.map { |char| char.length }
end

print string_length("to be or not to be")