class FavoritesController < ApplicationController
  before_action :owner_check, only: [:edit, :update, :destroy]


  def owner_check
    @favorite = Favorite.find(params['id'])
    if current_user.id != @favorite.user_id
      redirect_to root_url, notice: "That's not yours!"
    end
  end

  def index
    @favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = params[:user_id]
    @favorite.photo_id = params[:photo_id]

    if @favorite.save
      redirect_to :back, :notice => "Favorite created successfully."
    else
      render 'new'
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])

    @favorite.user_id = params[:user_id]
    @favorite.photo_id = params[:photo_id]

    if @favorite.save
      redirect_to favorite_url(@favorite.id), :notice => "Favorite updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy

    redirect_to :back, :notice => "Favorite deleted."
  end
end
