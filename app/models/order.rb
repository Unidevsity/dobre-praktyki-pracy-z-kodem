class Order

  attr_reader :confirmed, :user

  def initialize(user)
    @confirmed = false
    @user = user
    @total = 0
  end

  def confirm!
    @confirmed = true
  end

  def confirmable?
    @total > 100
  end
end
