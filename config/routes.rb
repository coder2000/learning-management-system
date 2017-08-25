Rails.application.routes.draw do
  root 'pages#login'

  post 'login' => 'sessions#authenticate', as: 'login'
  post 'request/join' => 'requests#join', as: 'join_group'

  get '/home' => 'pages#index', as: 'pages_index'

  delete '/logout' => 'sessions#destroy', as: 'logout'

  resources :users, except: %i[index new] do
    with_scope_level(:new) do
      get 'new/:role' => 'users#new', as: ''
    end
  end

  resources :groups do
    get 'request/accept/:user_id/' => 'requests#accept', as: 'accept_request'
    get 'requests' => 'requests#show', as: 'request'
    get 'members' => 'groups#members', as: 'members'
    delete 'members/:user_id/remove/' => 'groups#remove_member',
           as: 'remove_member'

    resources :posts, except: [:index] do
      resources :comments, except: %i[index show]
    end
  end

  resources :repositories do
    resources :records, only: %i[show create destroy]
  end
end
