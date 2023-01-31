class ConfirmOrder


  def call(order)
    return unless OrderPolicy.should_be_confirmed?(order)
    confirm_order(order)
    send_notification_confirmation(order)
    order
  end

  private

  def confirm_order(order)
    order.confirm!
  end

  def send_notification_confirmation(order)
    FirebaseService.send_notification(order.user, "Your order has been confirmed")
  end
end
