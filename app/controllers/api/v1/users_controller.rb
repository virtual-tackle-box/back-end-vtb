class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    
    begin 
      @user.save!

      # Check if the user has a phone number and send a welcome message
      if @user.phone_number.present?
        twilio_service.send_welcome_message(@user)
      end

      render json: UserSerializer.new(@user), status: 201
    rescue ActiveRecord::RecordInvalid => e 
      render json: { error: e.message }, status: 422 
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:email, :password, :password_confirmation, :phone_number)
  end

  def twilio_service
    @twilio_service ||= TwilioService.new
  end
end
