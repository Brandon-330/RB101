# Ask for the loan amount
# Ask for the APR
# Ask for loan duration

# validate all numbers

# through a monthly interest rate by taking annual percentage rate / 12
# Put loan duration to months
# monthly payment from the formula, put it in a method?

def prompt(s)
  puts "=> #{s}"
end


def valid_number?(num)
  # The loan amount, or APR, or loan duration CANNOT be 0!
  # Thus, we will not take into account string, or 0 as an answer
  num.to_f != 0
end


def months_number(input)
  if input.match(/months?/)
    1
  elsif input.match(/years?/)
    12
  else
    nil
  end
end


def formula(p, j, n)
  m = p * (j / (1 - (1 + j)**(-n)))
end


loan_amount = nil
loop do
  prompt("What is your loan amount? ")
  loan_amount = gets.chomp
  if valid_number?(loan_amount)
    loan_amount = loan_amount.to_f
    break
  else
    prompt("That is not a valid digit!")
  end
end

apr = nil
loop do
  prompt("What is your Annual Percentage Rate (APR) as a percentage? ")
  apr = gets.chomp
  if apr.end_with?('%')
    apr.delete!('%')
    if valid_number?(apr)
      apr = apr.to_f / (100 * 12)
      break
    else
      prompt("Please enter a valid digit!")
    end
  else
    prompt("Hmm... did you perhaps forget a % sign?")
  end
end

loan_duration = nil
loop do
  prompt("What is your loan duration (in months or years)? ")
  loan_duration = gets.chomp
  loan_duration = loan_duration.split(" ") rescue false
  months = months_number(loan_duration[1].downcase) rescue false
  if valid_number?(loan_duration[0])
    if months
      loan_duration = loan_duration[0].to_f * months
      break
    else
      prompt("Hmm... did you forget to add 'months' or 'years'?")
    end
  else
    prompt("Please enter a valid digit!")
  end
end


monthly_payment = formula(loan_amount.to_f, apr, loan_duration)

prompt("Your monthly payment is #{monthly_payment.round(2)}!")



