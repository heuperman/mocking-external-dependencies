class Greeter
  CONFIGURATION = {
    from: ENV['TWILIO_PHONE_NUMBER']
  }

  def initialize(client)
    @client = client
  end

  def message
    "Have a great day!"
  end

  def send_message(recipient)
    message_config = {
      from: CONFIGURATION[:from],
      to: recipient,
      body: message
    }
    @client.messages.create(message_config)
  end
end
