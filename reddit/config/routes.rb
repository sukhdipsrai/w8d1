Rails.application.routes.draw do
 
  resources :users, only: [:new, :create, :show, :index] 
  resource :session, only: [:create, :new, :destroy]
  resources :subs, except: [:destroy]
   resources :posts
end
