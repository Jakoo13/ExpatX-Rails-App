Rails.application.routes.draw do
  resources :users, only: %i[index show]
  resources :feed_posts
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
  get '/users/:id/feed_posts', to: 'users#get_feed_posts'
end
