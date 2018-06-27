require 'twilio-ruby'

class Greeter
  CONFIGURATION = {
    from: ENV['TWILIO_PHONE_NUMBER'],
    account_sid: ENV['TWILIO_ACCOUNT_SID'],
    auth_token: ENV['TWILIO_AUTH_TOKEN']
  }

  def initialize(client = Twilio::REST::Client.new(
    CONFIGURATION[:account_sid],
    CONFIGURATION[:auth_token]
  ))
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
