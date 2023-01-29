class BankAccountService

  def payment
    @account = BankAccount.first
    new_balance = @account.balance - 80
    @account.update(balance: new_balance)
  end

  def long_payment
    @account = BankAccount.first
    new_balance = @account.balance - 30
    @account.update(balance: new_balance)
    sleep 5
  end

end
