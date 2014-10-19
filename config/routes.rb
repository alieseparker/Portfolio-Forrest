Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :articles
  resources :projects
  post 'welcome/contact', to: 'welcome#contact'

  root 'welcome#index'

end
