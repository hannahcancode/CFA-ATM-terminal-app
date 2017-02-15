balance = 100
amount = 20

def withdraw(balance, deduction)
  if balance >= deduction
    balance -= deduction
  else
    puts "You don't have enough money to do that :("
  end
end

def deposit(balance, deposit)
  balance += deposit
end

def display(balance)
  puts "Balance: "+balance.to_s
  return balance
end

def action(balance)
  puts "For deposit enter 'D', for withdrawal enter 'W'"
  action = gets.chomp
  if action == 'D' || action == 'd'
    puts "How much do you want to deposit?"
    amount = gets.chomp.to_i
    display(deposit(balance, amount))
  elsif action == 'W' || action == 'w'
    puts "How much do you want to withdraw?"
    amount = gets.chomp.to_i
    display(withdraw(balance, amount))
  else
    puts "Error, please enter 'D' or 'W'"
    display(balance)
  return balance
  end
end

10.times do
  balance = action(balance)
end
