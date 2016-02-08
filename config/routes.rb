Rails.application.routes.draw do
  resources :diaries, only: %i(show new create edit update destroy) do
    resource :good, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end

  namespace :admin do
    resources :products
  end

  root 'diaries#index'

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
