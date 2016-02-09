Rails.application.routes.draw do
  resources :diaries, only: %i(show new create edit update destroy) do
    resource :good, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end

  resources :products, only: %i(index show) do
    resources :line_items, only: %i(create)
  end

  namespace :admin do
    resources :products
    resources :users, only: %i(index show edit update destroy)
  end

  resources :orders, only: %i(new create)

  resource :destination, only: %i(new create edit update destroy)
  resource :cart, only: %i(show destroy)

  root 'diaries#index'

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
