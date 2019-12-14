Rails.application.routes.draw do
  get 'main/index'
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests, shallow: true do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end

  resources :users, only: :create
  resources :sessions, only: :create

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :destroy, to: 'sessions#destroy'

  resources :main, only: :index

end
