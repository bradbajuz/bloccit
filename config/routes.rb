Bloccit::Application.routes.draw do

  resources :posts, only: [:index]
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
      resources :comments, only: [:create, :destroy]
      match '/up-vote', to: 'votes#up_vote', as: :up_vote, via: :get
      match '/down-vote', to: 'votes#down_vote', as: :down_vote, via: :get
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users, only: [:show, :index, :update]

  match "about", to: 'welcome#about', via: :get

  root to: 'welcome#index'
end
