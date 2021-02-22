Rails.application.routes.draw do
  root 'articles#index'

  resources :articles
  resources :tags, except: %i[index show]
end
