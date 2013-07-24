Teste::Application.routes.draw do
 

  get "user_sessions/new"

# resources :microposts

  resources  :users do 
    resources :microposts
  end
    root :to =>'users#index'
  
  resources :user_sessions  
     get 'login', to: 'user_sessions#new'
     get 'logout', to: 'user_sessions#destroy'

  
  
  

end
