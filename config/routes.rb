Rails.application.routes.draw do
  get 'questions/index'
  get 'questions/show'
  get 'questions/create'
  get 'questions/destroy'
  get 'questions/new'
  get 'questions/index'
  get 'questions/show'
  get 'questions/create'
  get 'questions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions
  end
end
