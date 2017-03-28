Rails.application.routes.draw do

  get "/", to: 'hosts#index'
  
  get "/signup", to: 'users#new' 
  post "/users", to: 'users#create'

  get "/login", to: 'sessions#new'
  post"/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'

  get "/contacts", to: 'contacts#index'
  get "/contacts/new", to: 'contacts#new'
  post "/contacts", to: 'contacts#create'
  get "/contacts/:id", to: 'contacts#show'
  get "/contacts/:id/edit", to: 'contacts#edit'
  patch "/contacts/:id", to: 'contacts#update'
  delete "/contacts/:id", to: 'contacts#destroy'

  get "/groups", to: 'groups#index'
  get "/groups/new", to: 'groups#new'
  get "/groups/:id", to: 'groups#show'
  post "/groups", to: 'groups#create'

  get "/messages/new", to: 'messages#new'
  post "/messages", to: 'messages#create'
  get "/messages/:id", to: 'messages#show'
  get "/messages/:id/edit", to: 'messages#edit'
  patch "/messages/:id", to: 'messages#update'

end

