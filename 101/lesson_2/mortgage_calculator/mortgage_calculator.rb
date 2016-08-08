def prompt(message)
  puts "=> #{message}"
end

def valid_number?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def another_calculation?
  loop do
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt("Please enter 'y' or 'n'.")
  end
end

# def valid_number?(num)
prompt "Welcome to Mortgage Calculator. Please enter your name:"

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt "Hi #{name}!"

prompt <<-MSG
To calculate your fixed monthly repayment amount, we need the following details:

(1) The loan amount;
(2) The Annual Percentage Rate; and
(3) The loan duration

Let's get started!
MSG

loop do # main loop
  # Loan Amount
  loan_amt = ''
  loop do
    prompt "Please enter your loan amount (in dollars):"
    loan_amt = gets.chomp
    if valid_number?(loan_amt)
      break
    else
      prompt "Not a valid loan amount. Please try again."
    end
  end

  loan_amt = loan_amt.to_f

  # Annual Percentage Rate
  apr = ''
  loop do
    prompt "Please enter the Annual Percentage Rate (APR) (in %)"
    apr = gets.chomp
    if valid_number?(apr)
      break
    else
      prompt "Not a valid APR. Please try again."
    end
  end

  mpr = apr.to_f / 12 / 100

  # Loan Duration
  loan_durn_yrs = ''
  loop do
    prompt "Please enter the loan duration (in years)"
    loan_durn_yrs = gets.chomp
    if valid_number?(loan_durn_yrs)
      break
    else
      prompt "Not a valid loan duration. Please try again."
    end
  end

  loan_durn_mths = loan_durn_yrs.to_i * 12
  mthly_rpt = loan_amt * (mpr * (1 + mpr)**loan_durn_mths) / \
              ((1 + mpr)**loan_durn_mths - 1)
  mthly_rpt_2dp = sprintf("%.2f", mthly_rpt)
  wkly_rpt =  loan_amt * (mpr * (1 + mpr)**loan_durn_mths) / \
              ((1 + mpr)**loan_durn_mths - 1)
  wkly_rpt_2dp = sprintf("%.2f", wkly_rpt * 12 / 52)

  prompt "Calculating your interest repayment..."
  prompt <<-MSG
  Your fixed monthly repayment amount is:
  $#{mthly_rpt_2dp} per month; or
  $#{wkly_rpt_2dp} per week."
  MSG
  prompt("Perform another calculation? (y/n)")
  break unless another_calculation?
end

prompt "Thanks for using Mortgage Calculator. Good bye!"
