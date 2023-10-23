class User < ApplicationRecord
  has_many :lures, dependent: :destroy
  has_many :catches, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :phone_number, format: { with: /\A\+\d+\z/, message: "should be in the format '+123456789'" }, allow_nil: true

  has_secure_password

  after_create :send_welcome_message

  private

  def send_welcome_message
    if phone_number.present?
      TwilioService.new.send_welcome_message(self)
      TwilioSenderJob.perform_async(self.id)
    end
  end
end