MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def time_of_day(minutes_given)
  hours = (minutes_given / MINUTES_PER_HOUR) % HOURS_PER_DAY
  minutes = minutes_given % MINUTES_PER_HOUR
  time = "#{format('%02d', hours)}:#{format('%.2d', minutes)}"
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"