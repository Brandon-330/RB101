ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

### Solution 1
#ages.select { |key, value| value if value < 100 }

### Solution 2
p ages.reject { |key, value| value if value > 100 }