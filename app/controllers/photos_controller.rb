class PhotosController < ApplicationController
  before_action :check_if_owner, only: [:destroy, :edit, :update]

  def check_if_owner
    @photo = Photo.find(params['id'])
    if current_user.id != @photo.user_id
      redirect_to root_url, notice: "Nope! That's not yours"
    end
  end

  def show
    @photo = Photo.find(params['id'])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.caption = params['the_caption']
    @photo.source = params['the_source']
    @photo.user_id = params['the_user_id']

    if @photo.save
      redirect_to photo_url(@photo.id)
    else
      render 'new'
    end

  end

  def destroy
    @photo = Photo.find(params['id'])
    @photo.destroy

    redirect_to photos_url
  end

  def edit
    @photo = Photo.find(params['id'])
  end

  def update
    @photo = Photo.find(params['id'])
    @photo.caption = params['the_caption']
    @photo.source = params['the_source']
    @photo.user_id = params['the_user_id']

    if @photo.save
      redirect_to photo_url(@photo.id)
    else
      render 'edit'
    end

  end

  def index
    @photos = Photo.all
    @comment = Comment.new
  end
end





