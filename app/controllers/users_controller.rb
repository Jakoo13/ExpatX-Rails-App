class UsersController < ApplicationController

    before_action :authenticate_user!
    before_action :find_user, only: %i[show]

    def index
        users = User.all
        render json: users, :except =>  [:created_at, :updated_at]
    end

    def show
        render json: @user
    end

    def get_feed_posts
        @user = User.find(params[:id])
        @feed_posts = @user.feed_posts
        render json: @feed_posts, :except =>  [:created_at]
    end
    
    private

    def find_user
        @user = User.find(params[:id])
    end

end