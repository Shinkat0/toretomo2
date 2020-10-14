Rails.application.routes.draw do
  get 'users/show'
  resources :post_trainings do
    resources :favorites, only: [:create, :destroy]
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show]
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
