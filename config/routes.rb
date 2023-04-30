Rails.application.routes.draw do
  resources :feed_post_likes
  resources :users, only: %i[index show]
  resources :feed_posts, :path => "feed-posts"
  resources :feed_post_comments, only: %i[create]

  devise_for :users,
  path: '',
  # This changes default path names for devise routes
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'register'
  },
  controllers: {
    sessions: 'sessions',
    registrations: 'registration'
  }

  # Get Feed Posts For User
  get '/users/:id/feed-posts', to: 'users#get_feed_posts'

  # like a post
  post '/feed-posts/:id/like', to: 'feed_posts#like'

  # Unlike a post
  post '/feed-posts/:id/unlike', to: 'feed_posts#unlike'
  
end
