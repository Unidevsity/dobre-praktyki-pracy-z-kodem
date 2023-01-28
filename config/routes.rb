Rails.application.routes.draw do
  root 'tasks#index'
  devise_for :users
  resources :tasks

  post 'languages/change', as: :change_language, controller: :languages, action: :change
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
