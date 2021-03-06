Rails.application.routes.draw do
  resources :diaries, only: %i(show new create edit update destroy) do
    resource :good, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end

  resources :products, only: %i(index show) do
    resource :line_item, only: %i(create destroy update)
  end

  namespace :admin do
    resources :products
    resources :users, only: %i(index show edit update destroy)
  end

  resources :orders, only: %i(new create index) do
    member do
      get :complete
    end
  end

  resource :destination, only: %i(new create edit update destroy)
  resource :cart, only: %i(show destroy)

  root 'diaries#index'

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
