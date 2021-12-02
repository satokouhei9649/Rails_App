Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "topics/search" => "topics#search"
  resources :topics 
  post "users/create" => "users#create"
  get "signup" => "users#new" 
  get "login" => "users#login_form"
  get "mytopics" => "topics#mytopics"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "topics/choice_create" => "choices#create"
  post "topics/votes" => "choices#votes"
  post "topics/votes_cancel" => "choices#votes_cancel"
  post "topics/choice_delete" => "choices#destroy"
  root 'topics#index'
end
