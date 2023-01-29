class RegisterUser

  def call
    user = User.new(email: 'rafal@grubykodzi.pl')

    user.save
    Notification.create(message: "User #{user.email} has been created")
  end
end
