Bloccit::Application.routes.draw do

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
      get '/up-vote', to: 'votes#up_vote', as: :up_vote
      get '/down-vote', to: 'votes#down_vote', as: :down_vote
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users, only: [:show, :index, :update]

  match "about", to: 'welcome#about', via: :get

  root to: 'welcome#index'
end
