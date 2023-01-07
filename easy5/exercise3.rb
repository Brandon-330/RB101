def format_hours(s)
  hours, minutes = s.split(':')
  hours, minutes = hours.to_i, minutes.to_i
end

def after_midnight(s)
  hours, minutes = format_hours(s)
  return 0 if hours == 0 || hours == 24
  minutes += hours * 60
end

def before_midnight(s)
  hours, minutes = format_hours(s)
  hours, minutes = 23 - hours, 60 - minutes
  if minutes == 60
    hours += 1
    minutes = 0
  end
  return 0 if hours == 0 || hours == 24
  minutes += hours * 60
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p before_midnight('12:00') == 720
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0