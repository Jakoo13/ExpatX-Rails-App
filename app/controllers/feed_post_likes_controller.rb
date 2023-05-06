class FeedPostLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feed_post_like, only: %i[ show update destroy ]

  # GET /feed_post_likes
  def index
    @feed_post_likes = FeedPostLike.all

    render json: @feed_post_likes
  end

  # # GET /feed_post_likes/1
  # def show
  #   render json: @feed_post_like
  # end

  # POST /feed_post_likes
  def create
    @feed_post_like = FeedPostLike.new(feed_post_like_params)

    if @feed_post_like.save
      # get updated feed post
      @feed_post = FeedPost.find(@feed_post_like.feed_post_id)
      render json: @feed_post, status: :created, location: @feed_post_like
    else
      render json: @feed_post_like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feed_post_likes/1
  def update
    if @feed_post_like.update(feed_post_like_params)
      render json: @feed_post_like
    else
      render json: @feed_post_like.errors, status: :unprocessable_entity
    end
  end


  # # DELETE /feed_post_likes/1
  # def destroy
  #   @feed_post_like.destroy
  # end

  # DELETE /feed_post_likes
  # Delete feed post like based on user_id and feed_post_id
  def unlike
    @feed_post_like = FeedPostLike.where(user_id: params[:user_id], feed_post_id: params[:feed_post_id]).first
    puts "USER ID: #{params[:user_id]} - FEED POST ID #{params[:feed_post_id]}"
    if @feed_post_like.nil?
      render json: {message: "Couldn't find like"}
      return
    end

    @feed_post_like.destroy
    render json: {message: "Post unliked"}
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed_post_like
      @feed_post_like = FeedPostLike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feed_post_like_params
      params.require(:feed_post_like).permit(:user_id, :feed_post_id)
    end
end
