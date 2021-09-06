class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @q = Comment.ransack(params[:q])
    @comments = @q.result(distinct: true).includes(:user, :photo,
                                                   :commentator).page(params[:page]).per(10)
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      message = "Comment was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @comment, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    message = "Comment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to comments_url, notice: message
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :photo_id, :contents)
  end
end
