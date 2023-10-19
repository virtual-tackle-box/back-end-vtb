class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    
    begin 
      @user.save!
      TwilioSenderJob.perform_async(@user.id)
      render json: UserSerializer.new(@user), status: 201
    rescue ActiveRecord::RecordInvalid => e 
      render json: { error: e.message }, status: 422 
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:email, :password, :password_confirmation, :phone_number)
  end
end
