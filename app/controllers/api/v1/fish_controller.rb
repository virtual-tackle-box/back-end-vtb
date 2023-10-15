class Api::V1::FishController < ApplicationController
  before_action :set_user
  before_action :set_fish, only: [:update, :show]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render json: FishSerializer.new(@user.fish), status: 200
  end

  def show
    render json: FishSerializer.new(@fish), status: 200
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_fish
    @fish = @user.fish.find(params[:id])
  end

  def record_not_found(error)
    # Extracts model name from the error message
    model_name = error.message.split(" ")[2..2].join(" ").gsub(/#/, '').singularize
  
    render json: { error: "No #{model_name} with that ID could be found" }, status: :not_found
  end
end