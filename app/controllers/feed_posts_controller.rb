class FeedPostsController < ApplicationController
    before_action :authenticate_user!
    # , :set_work_order, only: %i[ show update destroy ]

    # GET /feed_posts
    def index
        @feed_posts = FeedPost.all

        render json: @feed_posts
    end

    # GET /feed_posts/1
    def show
        render json: @feed_posts
    end

    # POST /feed_posts
    def create
        @feed_post = FeedPost.new(feed_post_params)

        if @feed_post.save
            render json: @feed_post, status: :created, location: @feed_post,  :except =>  [:updated_at]
        else
            render json: @feed_post.errors, status: :unprocessable_entity
        end
    end


    # PATCH/PUT /feed_posts/1
    def update
        if @feed_post.update(feed_post_params)
        render json: @feed_post
        else
        render json: @feed_post.errors, status: :unprocessable_entity
        end
    end

    # DELETE /feed_posts/1
    def destroy
        @feed_post.destroy
    end

    private 

    def feed_post_params
        params.require(:feed_post).permit(:content, :user_id)
    end
end