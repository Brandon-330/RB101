munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, hash|
  case hash['age']
  when (0..17)
    hash['age_group'] = 'kid'
  when (18..64)
    hash['age_group'] = 'adult'
  else
    hash['age_group'] = 'senior'
  end
end

p munsters