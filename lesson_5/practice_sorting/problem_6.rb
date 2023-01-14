def print_family_stats(hash)
  hash.each { |key, hash| puts "#{key} is a #{hash['age']}-year-old #{hash['gender']}." }
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

print_family_stats(munsters)