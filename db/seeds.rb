company = Company.create(name: "Acme")
account = Account.create(company: company)
credit_card = CreditCard.create(number: "1234567890", account: account)

