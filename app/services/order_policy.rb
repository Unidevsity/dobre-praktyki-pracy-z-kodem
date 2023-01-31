class OrderPolicy
  def self.should_be_confirmed?(order)
    order.confirmable? && order.user.present?
  end
end
