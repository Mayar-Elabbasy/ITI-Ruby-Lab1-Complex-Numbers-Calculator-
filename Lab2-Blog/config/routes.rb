Rails.application.routes.draw do
  get 'users/new'
  get 'welcome/index'
  
  resources :users
  resources :articles do
    resources :comments
  end
  
  root 'welcome#index'
end


