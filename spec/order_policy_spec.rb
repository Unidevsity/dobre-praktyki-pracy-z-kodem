describe OrderPolicy do
  describe '.should_be_confirmed?' do
    context 'when order is confirmable and user is present' do
      it 'returns true' do
        order = instance_double(Order, user: double, confirmable?:true)
        expect(OrderPolicy.should_be_confirmed?(order)).to eq true
      end

    end

    context 'when order is not confirmable' do
      it 'returns false' do
        order = instance_double(Order, user: double, confirmable?: false)
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
