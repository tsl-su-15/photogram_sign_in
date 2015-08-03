class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :check_if_owner, only: [:destroy, :edit, :update]

  def check_if_owner
    @photo = Photo.find(params['id'])
    if current_user.id != @photo.user_id
      redirect_to root_url, notice: "Nope! That's not yours"
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @photo}
    end
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to photo_url(@photo.id)
    else
      render 'new'
    end

  end

  def destroy
    @photo.destroy

    redirect_to photos_url
  end

  def edit
  end

  def update
    @photo.user_id = current_user.id

    if @photo.update_attributes(photo_params)
      redirect_to photo_url(@photo.id)
    else
      render 'edit'
    end

  end

  def index
    @photos = Photo.all
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.json { render json: @photos }
    end
  end

  private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:caption, :source)
    end
end





