def names_youngest_to_oldest(people)
  names = people.keys

  names.sort_by { |name| people[name] }
end

#Test Cases
people_1 = { 'jim' => 50, 'jill' => 25, "artemis" => 42, 'johnny' => 37, 'earl' => 65 }
people_2 = { 'alexandra' => 5, 'bob' => 94, "jolene" => 44, 'demosthenes' => 26 }
people_3 = { 'sigmund' => 10, 'jane' => 21, "colin" => 17 }

p names_youngest_to_oldest(people_1) == ['jill', 'johnny', 'artemis', 'jim', 'earl'] #=> true
p names_youngest_to_oldest(people_2) == ['alexandra', 'demosthenes', 'jolene', 'bob'] #=> true
p names_youngest_to_oldest(people_3) == ['sigmund', 'colin', 'jane'] #=> true