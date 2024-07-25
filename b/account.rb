class Account
  attr_accessor :account_number, :type, :balance, :transactions

  def initialize(account_number,type,balance=0)
    @account_number=account_number
    @type=type
    @balance=balance
    @transactions=[]
    # @transactions={
    #   date: Time.now,
    #   type: "h",
    #   amount: 56,
    #   balance_after: 78
    # }
  end

  def add_transaction(type,amount)
    transaction={
      date: Time.now,
      type: type,
      amount: amount,
      balance_after: @balance
    }
    @transactions << transaction
  end

  def list_transactions
    if @transactions.empty?
      puts "işlem yok"
    else
      @transactions.each do |transaction|
        puts  "Tarih: #{transaction[:date]}, Tür: #{transaction[:type]}, Tutar: #{transaction[:amount]}, Bakiye Sonrası: #{transaction[:balance_after]}"
      end #"#{date},#{type},#{amount},#{balance_after}"
    end
  end

  def deposit(amount)
    @balance += amount
    add_transaction("deposit",amount)
    puts "#{amount} TL hesabınıza eklendi"
  end

  def withdraw(amount)
    if @balance<amount
      puts "yetersiz bakiye"
    else
      @balance -= amount
      add_transaction("withdraw",amount)
      puts "#{amount} TL hesabınızdan çekildi"
    end
  end

end