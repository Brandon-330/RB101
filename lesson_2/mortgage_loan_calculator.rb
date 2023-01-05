# Ask for the loan amount
# Ask for the APR
# Ask for loan duration

# validate all numbers

# through a monthly interest rate by taking annual percentage rate / 12
# Put loan duration to months
# monthly payment from the formula, put it in a method?

def prompt(s)
  "=> #{s}"
end


def valid_number?(num)
  # The loan amount, or APR, or loan duration CANNOT be 0!
  # Thus, we will not take into account string, or 0 as an answer
  num.to_f != 0
end


def months?(input)
  months = case input
           when 'month' || 'months'
             1
           when 'year' || 'years'
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
  break if valid_number?(loan_amount)
end

apr = nil
loop do
  prompt("What is your APR as a percentage? ")
  apr = gets.chomp
  if apr.endswith("%")
    if valid_number?(apr.pop)
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
  loan_duration.split(" ")
  if number_valid?(loan_duration[0])
    if months?(loan_duration[1].downcase)
      loan_duration = loan_duration[0].to_f * loan_duration[1].to_i
      break
    else
      prompt("Please enter months or years!")
    end
  else
    prompt("Please enter a valid digit!")
  end
end

monthly_payment = formula(loan_amount, apr, loan_duration)

prompt("Your monthly payment is #{monthly_payment}!")



