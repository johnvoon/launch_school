class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# balance looks like a local variable but we are not instantiating any local variables here. 
# we are comparing the getter instance method balance to see whether it is greater than 0
# the getter instance method balance is created by way of attr_reader which returns the value of @balance instance variable
