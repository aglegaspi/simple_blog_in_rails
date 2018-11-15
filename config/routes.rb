Rails.application.routes.draw do
  
  get 'welcome/index'

  resources :articles do
    resources :comments
  end
  # this captures the hierarchal relationship between articles and comments


  root 'welcome#index'
end
