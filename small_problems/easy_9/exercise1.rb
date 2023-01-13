def greetings(arr_full_name, hash_job)
  "Hello, #{arr_full_name.join(' ')}! Nice to have a #{hash_job[:title]} #{hash_job[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."