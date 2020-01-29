Rails.application.routes.draw do

devise_for :users, path_names: { sign_in: :login, sign_out: :logout }

root to: 'tests#index'

  get 'main/index'
  #get 'sessions/new'
  #get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests, only: :index, shallow: true do
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

  namespace :admin do
    resources :tests
  end

  #delete :destroy, to: 'sessions#destroy'

  resources :main, only: :index

end
