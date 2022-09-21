Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :new, :show]
  resource :session, only:[:create, :destroy, :new]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, only: [:create, :edit, :show, :update, :destroy]
end
