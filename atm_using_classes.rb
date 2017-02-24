class Atm
  def initialize(balance)
    @balance = balance
  end

  attr_accessor :balance

  def dispense(amount)
    #if @balance >= amount
    @balance -= amount
    puts "*ATM dispenses #{amount}*"
    display_balance

    # else
    #   puts "Sorry the ATM is doesn't have that much available"
    # end
  end

  def take_money(amount)
    puts "*ATM sucks in #{amount}*"
    @balance += amount
    display_balance

  end

  def display_balance
    puts "This ATM has $#{balance}."
  end
end

class Account
  def initialize(balance, id)
    @balance = balance
    @id = id
    @defaultamount = 0
    @active = true
  end

  attr_accessor :balance, :defaultamount, :active, :id

  def withdraw(atm)
    if @balance >= @defaultamount && atm.balance >= @defaultamount
      atm.dispense(@defaultamount)
      @balance -= @defaultamount
      display_balance
    else
      puts "Sorry you don't have enough money for that"
      display_balance
    end
  end

  def deposit(atm)
    atm.take_money(@defaultamount)
    @balance += @defaultamount
    display_balance
  end

  def display_balance
    puts "You have $#{balance} in your account."
  end
end

user0 = Account.new(100, 123)
user1 = Account.new(100, 234)
users = [user0, user1]
atm0 = Atm.new(10000)
atms = [atm0]

def get_int_input
  gets.chomp.to_i
end


def talk_to_user(user, atm)
  puts "What do you want to do?\n1. Withdraw\n2. Deposit\n3. Quit"
  action = gets.chomp.downcase
  case action
  when "1.", "1", "withdraw", "1. withdraw"
    puts "How much do you want to withdraw?"
    user.defaultamount = get_int_input
    user.withdraw(atm)
  when "2.", "2", "deposit", "2. deposit"
    puts "How much do you want to deposit?"
    user.defaultamount = get_int_input
    user.deposit(atm)
  when "3.", "3", "quit", "3. quit"
    user.active = false
  else puts "I don't understand"
  end
  puts "Thank you."

end

puts "What ATM are you using?"
atm_id = get_int_input
puts "What is your account ID?"
user_id = get_int_input
user = users.find {|s| s.id == user_id }
if user != nil && atm_id < atms.length

  puts "Welcome User #{user_id}"
  user.active = true
  atms[atm_id].display_balance
  user.display_balance

  while user.active == true do
    talk_to_user(user, atms[atm_id])
  end
else
  puts "Make sure your ATM ID and account ID are valid."
end
