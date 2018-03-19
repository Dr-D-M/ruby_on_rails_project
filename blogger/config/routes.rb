Rails.application.routes.draw do
root 'drinks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'articles#index'
  resources :articles do
  	resources :comments
  	resources :reviews
  end
  resources :tags
  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]

get 'login'  => 'author_sessions#new'
get 'logout' => 'author_sessions#destroy'
end

