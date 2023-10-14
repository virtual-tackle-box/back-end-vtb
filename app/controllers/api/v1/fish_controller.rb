class Api::V1::FishController < ApplicationController
  before_action :set_user
  def index
    render json: FishSerializer.new(@user.fish), status: 200
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end