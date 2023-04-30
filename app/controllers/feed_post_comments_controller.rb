class FeedPostCommentsController < ApplicationController
    before_action :authenticate_user!

    # POST /feed_post_comments
    # required user_id, comment, feed_post_id
    def create
        @feed_post_comment = FeedPostComment.new(feed_post_comment_params)
        
        if @feed_post_comment.save
            render json: {message: "Comment created"}
        else
            render json: {message: "Comment not created"}, status: :unprocessable_entity
        end
    end

    private


    def feed_post_comment_params
        params.require(:feed_post_comment).permit(:comment, :user_id, :feed_post_id)
    end

end