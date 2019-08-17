Rails.application.routes.draw do
  namespace :static_pages do
    get 'about/author'
  end
  get 'static_pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
