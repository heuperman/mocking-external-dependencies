class Greeter
  CONFIGURATION = {
    from: ENV['TWILIO_PHONE_NUMBER']  
  }

  def initialize(client)
  end

  def message
    "Have a great day!"
  end
end
