require_relative 'account'
require_relative 'customer'
require_relative 'bank'

def display_menu
  puts "\nBank Management System"
  puts "1. Add Customer"
  puts "2. Remove Customer"
  puts "3. List Customers"
  puts "4. Add Account"
  puts "5. Remove Account"
  puts "6. List Accounts"
  puts "7. List Customer Accounts and Transactions"
  puts "8. Exit"
  print "Choose an option (1-9): "
end
def prompt(message)
  print "#{message}: "
  gets.chomp
end

def add_customer
  customer_id=prompt("müşteri id :")
  customer_name=prompt("müşteri adı :")
  customer_email=prompt("müşteri mail adresi :")
  customer=Customer.new(customer_id,customer_name,customer_email)
  Bank.add_customer(customer)
end
def remove_customer
  customer_id = prompt("Müşteri id giriniz")
  customer = Bank.find_customer(customer_id)

  if customer
    Bank.remove_customer(customer_id)
  else
    puts "müşteri bulunamadı"
  end
end
def list_customers
  Bank.list_customers
end
def add_account
  customer_id=prompt("müşteri id :")
  customer= Bank.find_customer(customer_id)
  if customer
    account_number= prompt("hesap numarası: ")
    account_type =prompt("hesap tipi: ")
    account_balance= prompt("bakiye: ")
    account=Account.new(account_number,account_type,account_balance)
    Bank.add_account(account)
  else 
    puts "müşteri bulunamadı"
  end
end
def remove_account
  account_number = prompt("hesap numarası giriniz")
  account = Bank.find_account(account_number)

  if account
    Bank.remove_account(account_number)
  else
    puts "hesap bulunamadı"
  end
end
def list_accounts
  Bank.list_accounts
end
def list_transactions
  Account.list_transactions
end

loop do
  display_menu
  choice = gets.chomp.to_i

  case choice
  when 1
    add_customer
  when 2
    remove_customer
  when 3
    list_customers
  when 4
    add_account
  when 5
    remove_account
  when 6
    list_accounts
  when 7
    account = Account.new()
    account.list_transactions
  when 8
    puts "Exiting..."
    break
  else
    puts "geçersiz seçim"
  end
end