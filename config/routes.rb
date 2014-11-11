Rails.application.routes.draw do

  devise_for :users
  resources :assignments

  resources :projects
  root 'projects#index'
end
