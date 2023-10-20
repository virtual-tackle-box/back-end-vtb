class TwilioService
  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_welcome_message(user)
    message = @client.messages.create(
      body: "Welcome to Virtual Tacklebox! Thank you for joining, stay tuned for important fishing updates!",
      from: twilio_phone_number,
      to: user.phone_number
    )
  end

  private

  def account_sid
    Rails.application.credentials.twilio[:account_sid]
  end

  def auth_token
    Rails.application.credentials.twilio[:auth_token]
  end

  def twilio_phone_number
    Rails.application.credentials.twilio[:phone_number]
  end
end