Rails.application.routes.draw do
  get 'lists/index'

  get 'lists/new'

  get 'lists/create'

  get 'lists/show'

  get 'lists/edit'

  get 'lists/destroy'

  get 'items/create'

  get 'users/show'

  devise_for :users
  resources :users, only: [:update, :show] do
    resources :items, only: [:create]
  end

  authenticated :user do
    root to: "users#show", as: :authenticated_root, via: :get
  end

  unauthenticated do
    root to: 'welcome#index'
  end
end
