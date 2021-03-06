Rails.application.routes.draw do
  get 'messages/create'
  get 'rooms/create'
  get 'rooms/show'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search', to: 'searchs#search'

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
end