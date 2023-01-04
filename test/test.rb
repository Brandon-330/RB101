def string_length(sentence)
    words = sentence.split
    word_lengths = []
    
    words.each do |word|
        word_lengths << word.size
    end
end

print string_length("to be or not to be")