require 'greeter'

describe Greeter do
  let(:message) { double(:message) }
  let(:twilio_client) { double(:twilio_client) }

  subject { described_class.new(twilio_client) }

  describe '#message' do
    it 'returns the greeting message' do
      expect(subject.message).to eq 'Have a great day!'
    end
  end

  describe '#send_message' do
    it 'returns a message' do
      recipient = "+44476532212"
      expect(subject.send_message(recipient)).to eq message
    end
  end
end
