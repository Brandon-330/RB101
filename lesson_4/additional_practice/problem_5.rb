flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = nil
flintstones.each.with_index { |value, ind| index = ind if value.start_with?('Be') }
p index