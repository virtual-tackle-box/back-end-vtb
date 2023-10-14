class Api::V1::FishController < ApplicationController
  def index
    render json: FishSerializer.new(@user.fish), status: 200
  end
end