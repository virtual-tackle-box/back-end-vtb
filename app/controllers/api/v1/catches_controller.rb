class Api::V1::CatchesController < ApplicationController
  before_action :set_user
  before_action :set_catch, only: [:update, :show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    catches = @user.catches.with_attached_catch_images
    render json: CatchSerializer.new(catches), status: 200
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
    if params[:photos_to_delete]
      purge_photos(params[:photos_to_delete])
    end
    if @catch.update(catch_params)
      render json: CatchSerializer.new(@catch), status: 200
    else
      render json: { error: "Validation failed: #{@catch.errors.full_messages.join(", ")}" }, status: 422
    end
  end

  def destroy
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
    params.require(:catch).permit(:species, :weight, :length, :spot_name, :latitude, :longitude, :lure)
  end

  def purge_photos(ids_to_delete)
    photo_ids = ids_to_delete.split(",").map(&:to_i)
    purged_photos = []
    errors = []
  
    photo_ids.each do |id|
      begin
        photo = @catch.photos.find(id)
        photo.purge_later
        purged_photos << id
      rescue ActiveRecord::RecordNotFound => e
        errors << "Photo with ID #{id} could not be found"
      end
    end
    
    # We can return both purged_photos and errors, what do you think?
    return purged_photos, errors
  end
  

  def record_not_found(error)
    # Extracts model name from the error message
    model_name = error.message.split(" ")[2..2].join(" ").gsub(/#/, '').singularize
  
    render json: { error: "No #{model_name} with that ID could be found" }, status: :not_found
  end
end