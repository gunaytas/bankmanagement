class Customer
  attr_accessor :id, :name, :email, :customer

  def initialize(id,name,email)
    @id=id
    @name=name
    @email=email
    @accounts= []
  end

  # def add_account(account)
  #   @account << account
  # end

  # def remove_account(account_number)
  #   @account.reject! {|account| {account.account_number==account_number}}
  # end


end