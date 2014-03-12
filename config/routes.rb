Bloccit::Application.routes.draw do

  get "comments/new"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
      # match '/up-vote', to: 'votes#up_vote', via: :get, as: :up_vote
      # match '/down-vote', to: 'votes#down_vote', via: :get, as: :down_vote
    end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
