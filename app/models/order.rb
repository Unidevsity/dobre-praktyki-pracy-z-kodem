class Order

  attr_reader :confirmed, :user

  def initialize
    @confirmed = false
    @user = User.new
    @total = 0
  end

  def confirm!
    @confirmed = true
  end

  def confirmable?
    @total > 100
  end
end
