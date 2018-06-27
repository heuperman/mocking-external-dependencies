require 'greeter'

describe Greeter do
  describe '#message' do
    it 'returns the greeting message' do
      expect(subject.message).to eq 'Have a great day!'
    end
  end
end
