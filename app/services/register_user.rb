class RegisterUser

  def call
    ActiveRecord::Base.transaction do
      user = User.new(email: 'rafal@grubykodzi.pl')
      user.save!
      Notification.create(message: "User #{user.email} has been created")
    end
  end
end
