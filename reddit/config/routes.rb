Rails.application.routes.draw do
 
  resources :users, only: [:new, :create, :show, :index] 
  resource :session, only: [:create, :new, :destroy]
  resources :subs, except: [:destroy] do 
    resources :posts, only: [:index]
  end
  resources :posts, except: [:index]
end
