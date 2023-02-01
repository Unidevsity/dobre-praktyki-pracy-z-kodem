class ConfirmOrder

  def call(order)
    unless OrderPolicy.should_be_confirmed?(order)
      return OpenStruct.new(success: false, result: order)
    end
    confirm_order(order)
    send_notification_confirmation(order)
    OpenStruct.new(success: true, result: order)
  rescue FirebaseService::FirebaseConnectionError => e
    return OpenStruct.new(success: false, errors: ['Firebase connection error'])
  end

  private

  def confirm_order(order)
    order.confirm!
  end

  def send_notification_confirmation(order)
    FirebaseService.send_notification(order.user, "Your order has been confirmed")
  end
end
