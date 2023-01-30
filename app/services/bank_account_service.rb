class BankAccountService

  def payment
    ActiveRecord::Base.transaction do
      @account = BankAccount.first
      new_balance = @account.balance - 80
      @account.update(balance: new_balance)
    end
  end

  def long_payment
    ActiveRecord::Base.transaction do
      @account = BankAccount.first
      new_balance = @account.balance - 30
      @account.update(balance: new_balance)
      @account.lock!
      sleep 5
    end
  end

end
