Rails.application.routes.draw do
  root to: 'homes#index'
  resources :homes, only: :index do
    collection do
      get :about
    end
  end
  get 'users/show'
  resources :post_trainings do
    resources :favorites, only: [:create, :destroy]
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  devise_for :users
  resources :users, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
