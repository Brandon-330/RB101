require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  return true if num == '0'
  num.to_i() != 0
end

def number?(num)
  num.start_with?('0') || num.to_f() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  else
    'Error'
  end
end

prompt(MESSAGES['en']['welcome'])

name = nil
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['en']['valid_name'])
  else
    break
  end
end

prompt("Hi #{name.capitalize!}!")

loop do # Main loop
  num1 = nil
  loop do
    prompt(MESSAGES['en']['num1'])
    num1 = Kernel.gets().chomp()

    if number?(num1)
      break
    else
      prompt(MESSAGES['en']['valid_number'])
    end
  end

  num2 = nil
  loop do
    prompt(MESSAGES['en']['num2'])
    num2 = Kernel.gets().chomp()

    if number?(num2)
      break
    else
      prompt(MESSAGES['en']['valid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt(operator_prompt)

  operator = nil
  loop do 
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['en']['valid_choice'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  sleep(2)

  result = case operator
          when '1'
            result = num1.to_f() + num2.to_f()
          when '2'
            result = num1.to_f() - num2.to_f()
          when '3'
            result = num1.to_f() * num2.to_f()
          when '4'
            result = num1.to_f() / num2.to_f()
  end

  prompt("The result is #{result}")

  prompt(MESSAGE['en']['loop'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['en']['goodbye'])