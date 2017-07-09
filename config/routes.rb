Rails.application.routes.draw do
  root "pages#login"
  
  post "login" => "sessions#authenticate", as: "login"
  post "request/join" => "requests#join", as: "join_group"

  get "/home" => "pages#index", as: "pages_index"

  delete "/logout" => "sessions#destroy", as: "logout"

  resources :users, except: [:index, :new] do
    with_scope_level(:new) do
      get 'new/:role' => "users#new", as: ''
    end
  end

  resources :groups do

    get "request/accept/:user_id/group/:group_id" => "requests#accept", as: "accept_request"
    get "requests/:code" => "requests#show", as: "request"
    get "members" => "groups#members",       as: "members"

    resources :posts, except: [:index] do
      resources :comments, except: [ :index, :show ]
    end
  end
  resources :repositories do
    resources :records, only: [:show, :create, :destroy]
  end
end
