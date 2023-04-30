class FeedPostsController < ApplicationController
    before_action :authenticate_user!
    # , :set_work_order, only: %i[ show update destroy ]

    # GET /feed_posts
    def index

        # Showing most recent first in list
        @feed_posts = FeedPost.order('created_at DESC')
   
        render json: @feed_posts, :except =>  [:updated_at, :user_id]
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
        @feed_post = FeedPost.find(params[:id])
        if @feed_post.destroy
            render json: {message: "Post deleted"}
        else
            render json: {message: "Post not deleted"}
        end
    end

    def get_comments
        @feed_post = FeedPost.find(params[:id])
        @feed_post_comments = @feed_post.feed_post_comments
        render json: @feed_post_comments
    end 

    # POST /feed_posts/1/comments
    def add_comment
        @feed_post = FeedPost.find(params[:id])
        @feed_post_comment = FeedPostComment.new(feed_post_comment_params)
        @feed_post_comment.feed_post = @feed_post
        if @feed_post_comment.save
            render json: @feed_post_comment, status: :created, location: @feed_post_comment,  :except =>  [:updated_at]
        else
            render json: @feed_post_comment.errors, status: :unprocessable_entity
        end
    end

    private 

    def feed_post_params
        params.require(:feed_post).permit(:content, :language, :user_id)
    end

end