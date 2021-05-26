Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  get 'search_stock', to: 'stocks#search'
  resources :users, only: [:show]
  get 'friends', to: 'users#friends'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_friend', to: 'users#search'
end
