Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations], controllers: {sessions: 'admins/sessions'}
  devise_for :users, controllers: {registrations: 'users/registrations'}

  namespace :admin do
    root to: 'home#index'
    resources :admins
    resources :users, only: :index
    resources :posts, only: [:index, :show]
  end

  root to: 'user/timeline#index'

  namespace :user do
    get 'profile', to: 'profile#show'
    get 'potential_to_follow', to: 'profile#potential_to_follow'
    get 'following', to: 'profile#following'
    get 'followers', to: 'profile#followers'
    resources :posts, only: [:create, :destroy]
    resources :users, only: :show

    post 'follow/:id', to: 'subscriptions#follow', as: :follow
    post 'unfollow/:id', to: 'subscriptions#unfollow', as: :unfollow
  end
end
