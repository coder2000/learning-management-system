Rails.application.routes.draw do
  root "pages#login"
  
  ##################
  ##################
  ####          ####
  ####   post   ####
  ####          ####
  ##################
  ##################

  post "login" => "sessions#authenticate", as: "login"
  post "request/join" => "requests#join", as: "join_group"

  ##################
  ##################
  ####          ####
  ####   get    ####
  ####          ####
  ##################
  ##################
  
  get "/home" => "pages#index", as: "pages_index"
  get "request/accept/:user_id/group/:group_id" => "requests#accept", as: "accept_request"
  get "requests/:code" => "requests#show", as: "request"

  ##################
  ##################
  ####          ####
  ####   delete ####
  ####          ####
  ##################
  ##################

  delete "/logout" => "sessions#destroy", as: "logout"

  resources :users, except: [:index, :new] do
    with_scope_level(:new) do
      get 'new/:role' => "users#new", as: ''
    end
  end

  resources :groups
  resources :video_repositories do
    resources :videos, only: [:show, :create, :destroy]
  end
end
