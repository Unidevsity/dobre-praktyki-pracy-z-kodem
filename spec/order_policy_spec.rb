describe OrderPolicy do
  describe '.should_be_confirmed?' do
    context 'when order is confirmable and user is present' do
      it 'returns true' do
        order = Order.new(User.new)
        allow(order).to receive(:confirmable?).and_return(true)
        expect(OrderPolicy.should_be_confirmed?(order)).to eq true
      end

    end

    context 'when order is not confirmable' do
      it 'returns false' do
        order = Order.new(User.new)
        allow(order).to receive(:confirmable?).and_return(false)
        expect(OrderPolicy.should_be_confirmed?(order)).to eq false
      end
    end

    context 'when user is not present' do
      it 'returns false' do
        order = Order.new(nil)
        expect(OrderPolicy.should_be_confirmed?(order)).to eq false
      end
    end
  end
end
