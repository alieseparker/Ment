Rails.application.routes.draw do

  devise_for :users

  resources :projects
  root 'projects#index'
  post 'join_project/:id' => 'projects#join_project', as: :join_project
end
