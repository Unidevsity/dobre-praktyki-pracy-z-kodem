describe ConfirmOrder do

  before do
    allow(FirebaseService).to receive(:send_notification)
  end

  context 'when order should be confirmed' do


    it 'returns confirmed order' do
      user = double

      order = Order.new(user)
      allow(OrderPolicy).to receive(:should_be_confirmed?).with(order).and_return(true)

      command = ConfirmOrder.new.call(order)
      expect(command.success).to eq true
      order = command.result
      expect(order.confirmed).to eq true
    end
  end

  context 'when order should not be confirmed' do

    it 'fails' do
      user = double
      order = Order.new(user)
      allow(OrderPolicy).to receive(:should_be_confirmed?).with(order).and_return(false)

      command = ConfirmOrder.new.call(order)
      expect(command.success).to eq false
      order = command.result
      expect(order.confirmed).to eq false
    end
  end

  context 'when firebase service fails' do
    it 'fails' do
      user = double
      order = Order.new(user)
      allow(OrderPolicy).to receive(:should_be_confirmed?).with(order).and_return(true)
      allow(FirebaseService).to receive(:send_notification).and_raise(FirebaseService::FirebaseConnectionError)
      command = ConfirmOrder.new.call(order)
      expect(command.success).to be false
      expect(command.errors).to eq ['Firebase connection error']
    end
  end
end
