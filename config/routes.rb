Rails.application.routes.draw do
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
end
