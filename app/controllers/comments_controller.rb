class CommentsController < ApplicationController
  before_action :check_if_owner, only: [:edit, :update, :destroy]

  def check_if_owner
    @comment = Comment.find(params['id'])
    if current_user.id != @comment.user_id
      redirect_to root_url, notice: "You can't do that"
    end
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.photo_id = params[:photo_id]
    @comment.contents = params[:contents]

    if @comment.save
      redirect_to :back, :notice => "Comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.user_id = current_user.id
    @comment.photo_id = params[:photo_id]
    @comment.contents = params[:contents]

    if @comment.save
      redirect_to comment_url(@comment.id), :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to comments_url, :notice => "Comment deleted."
  end
end
