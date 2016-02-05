Rails.application.routes.draw do
  resources :diaries, only: %i(show new create edit update destroy)

  root 'diaries#index'

  devise_for :users
end
