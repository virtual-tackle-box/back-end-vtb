class TwilioSenderJob
  include Sidekiq::Job

  def perform(user_id)
    user = User.find(user_id)
    twilio_service = TwilioService.new
    twilio_service.send_welcome_message(user) if user.phone_number.present?
  end
end