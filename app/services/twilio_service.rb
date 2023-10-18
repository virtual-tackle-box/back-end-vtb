class TwilioService
  def initialize
    @client = Twilio::REST::Client.new
  end

  def send_welcome_message(phone_number)
    
  end
end