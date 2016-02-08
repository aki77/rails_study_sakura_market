Rails.application.routes.draw do
  resources :comments
  resources :goods
  resources :diaries, only: %i(show new create edit update destroy) do
    resource :good, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end

  root 'diaries#index'

  devise_for :users
end
