Aggrestation::Application.routes.draw do
  root :to => 'pages#index'
  
  resources :pages
  resources :feeds do
    get 'fetch', :on => :member
    resources :keywords
  end
end
