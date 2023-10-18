require "rails_helper"

RSpec.describe User, type: :model do

  describe "relationships" do 
    it { should have_many :lures }
    it { should have_many :catches }
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
    it { should allow_value("+123456789").for(:phone_number) }
    it { should_not allow_value("invalid_number").for(:phone_number) }
    it { should allow_value(nil).for(:phone_number) }
  end

  describe "callbacks" do
    describe "after_create" do
      it "sends a welcome message if phone_number is present" do
        user = build(:user, phone_number: "+123456789")
        
        # Assuming you have a proper factory defined for User (using FactoryBot)
        expect_any_instance_of(TwilioService).to receive(:send_welcome_message).with(user)

        user.save
      end

      it "does not send a welcome message if phone_number is not present" do
        user = build(:user, phone_number: nil)
        
        # Assuming you have a proper factory defined for User (using FactoryBot)
        expect_any_instance_of(TwilioService).not_to receive(:send_welcome_message)

        user.save
      end
    end
  end
end