require 'greeter'

describe Greeter do
  let(:message) { double(:message) }
  let(:twilio_client) { double(:twilio_client) }
  let(:messages_client) { double(:messages_client) }

  subject { described_class.new(twilio_client) }

  describe '#message' do
    it 'returns the greeting message' do
      expect(subject.message).to eq 'Have a great day!'
    end
  end

  describe '#send_message' do
    it 'returns a message' do
      recipient = "+44476532212"
      message_config = {
        to: recipient,
        from: Greeter::CONFIGURATION[:from],
        body: 'Have a great day!'
      }

      allow(twilio_client).to receive(:messages).and_return messages_client
      allow(messages_client).to receive(:create).with(message_config).and_return message

      expect(subject.send_message(recipient)).to eq message
    end
  end
end
