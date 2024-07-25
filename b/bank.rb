class Bank
  @customers=[]
  @accounts=[]

  class << self
    attr_accessor :customers ,:accounts

  def initialize
    @customers=[]
    @accounts=[]
  end
  
  def customers
    @customers
  end
  def accounts
    @accounts
  end

  def add_account(account)
    @accounts << account
    puts "hesap eklendi"
  end

  def remove_account(account_number)
    @accounts.reject! {|account| account.account_number==account_number}
    puts "hesap silindi"
  end

  def list_accounts
    if @accounts.empty? 
      puts "hesap yok"
    else
      @accounts.each do |account|
        puts "#{account.account_number},#{account.type},#{account.balance}"
      end
    end
  end
  def find_account(account_id)
    @accounts.find {|account| account.account_number=account_id}
  end

  def add_customer(customer)
    @customers << customer
    puts "müşteri eklendi"
  end

  def remove_customer(customer_id)
    @customers.reject! {|customer| customer.id=customer_id}
    puts "müşteri silindi"
  end

  def find_customer(customer_id)
    @customers.find {|customer| customer.id=customer_id}
  end

  def list_customers
    if @customers.empty? 
      puts "müşteri yok"
    else
      @customers.each do |customer|
        puts "#{customer.id},#{customer.name},#{customer.email}"
      end
    end
  end
end

end