Rails.application.routes.draw do
  
  # Dapatin delete method melalui ajax
  resources :articles do
    get "delete"
    collection { post :import }
  end 

  # ROUTE STANDARD

  # get 'articles/edit', to: "articles#edit", as: :articles
  # ------------------------------------------------------

  # get "sign_up" => "users#new", :as => "sign_up"
  # get "login" => "session#new", :as => "login"
  resources :users
  resources :sessions

  # RESTFULL ROUTE
  root :to => "articles#index" 
  resources :articles

  resources :comments
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
