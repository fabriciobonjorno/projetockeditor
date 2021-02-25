Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'

  resources :articles
  resources :tags, except: %i[index show]
end
