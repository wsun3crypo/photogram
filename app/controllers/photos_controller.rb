class PhotosController < ApplicationController
  before_action :current_user_must_be_photo_user,
                only: %i[edit update destroy]

  before_action :set_photo, only: %i[show edit update destroy]

  def index
    @q = Photo.ransack(params[:q])
    @photos = @q.result(distinct: true).includes(:user, :likes,
                                                 :comments).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @photo = Photo.new
  end

  def edit; end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      message = "Photo was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @photo, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    message = "Photo was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to photos_url, notice: message
    end
  end

  private

  def current_user_must_be_photo_user
    set_photo
    unless current_user == @photo.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:caption, :image, :user_id)
  end
end
