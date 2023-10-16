class Api::V1::CatchesController < ApplicationController
  before_action :set_user
  before_action :set_catch, only: [:update, :show]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render json: CatchSerializer.new(@user.catches), status: 200
  end

  def show
    render json: CatchSerializer.new(@catch), status: 200
  end

  def create
    @catch = @user.catches.build(catch_params)
    begin
      @catch.save!
      render json: CatchSerializer.new(@catch), status: 201
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: 422
    end
  end

  def update
    begin
      @catch.update!(catch_params)
      render json: CatchSerializer.new(@catch), status: 200
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: 422
    end
  end

  def destroy
    @catch = @user.catches.find(params[:id])
      @catch.destroy
      render json: { message: "Catch successfully deleted" }, status: 200
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_catch
    @catch = @user.catches.find(params[:id])
  end

  def catch_params
    params.require(:catch).permit(:species, :weight, :length, :spot_name, :latitude, :longitude, :lure, :photo_url)
  end

  def record_not_found(error)
    # Extracts model name from the error message
    model_name = error.message.split(" ")[2..2].join(" ").gsub(/#/, '').singularize
  
    render json: { error: "No #{model_name} with that ID could be found" }, status: :not_found
  end
end