Rails.application.routes.draw do

  root 'welcome#index'
  resources :users
  resources :todos
  #Need to add in associations here. 

  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

end

#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         welcome#index
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
#     todos GET    /todos(.:format)          todos#index
#           POST   /todos(.:format)          todos#create
#  new_todo GET    /todos/new(.:format)      todos#new
# edit_todo GET    /todos/:id/edit(.:format) todos#edit
#      todo GET    /todos/:id(.:format)      todos#show
#           PATCH  /todos/:id(.:format)      todos#update
#           PUT    /todos/:id(.:format)      todos#update
#           DELETE /todos/:id(.:format)      todos#destroy
#  sessions POST   /sessions(.:format)       sessions#create
#           DELETE /sessions(.:format)       sessions#destroy

