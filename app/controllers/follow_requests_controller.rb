class FollowRequestsController < ApplicationController
  before_action :set_follow_request, only: [:show, :edit, :update, :destroy]

  # GET /follow_requests
  def index
    @follow_requests = FollowRequest.page(params[:page]).per(10)
  end

  # GET /follow_requests/1
  def show
  end

  # GET /follow_requests/new
  def new
    @follow_request = FollowRequest.new
  end

  # GET /follow_requests/1/edit
  def edit
  end

  # POST /follow_requests
  def create
    @follow_request = FollowRequest.new(follow_request_params)

    if @follow_request.save
      message = 'FollowRequest was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @follow_request, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /follow_requests/1
  def update
    if @follow_request.update(follow_request_params)
      redirect_to @follow_request, notice: 'Follow request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /follow_requests/1
  def destroy
    @follow_request.destroy
    message = "FollowRequest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to follow_requests_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow_request
      @follow_request = FollowRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def follow_request_params
      params.require(:follow_request).permit(:sender_id, :recipient_id)
    end
end
