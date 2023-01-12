vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(vehicle)
  uniq_arr = vehicle.uniq
  hash = uniq_arr.each.with_object({}) do |uniq_vehicles, hash|
    hash[uniq_vehicles] = vehicle.count(uniq_vehicles)
  end
  hash
end

count_occurrences(vehicles)