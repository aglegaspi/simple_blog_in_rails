Rails.application.routes.draw do
  get 'articles/new'
  get 'articles/create'
  get 'articles/update'
  get 'articles/edit'
  get 'articles/destroy'
  get 'articles/index'
  get 'articles/show'
  get 'welcome/index'

  resources :articles

  root 'welcome#index'
end
