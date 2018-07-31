Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :ui, only: [:index, :create, :destroy, :edit, :update]
  resources :tasks, only: [:create, :destroy, :edit, :update]

  root  'ui#index'	
  match '/signup',  		      to: 'users#new',             via: 'get'

  match '/signin',  	    	  to: 'sessions#new',          via: 'get'
  match '/signout', 	     	  to: 'sessions#destroy',      via: 'delete'

  match 'ui/create',		      to: 'ui#create',			       via: 'post'
  match 'ui/destroy/:id',   	to: 'ui#destroy',		       	 via: 'delete'
  match 'ui/edit/:id',		    to: 'ui#edit',			     	   via: 'get'
  match 'ui/update/:id',      to: 'ui#update',             via: 'patch'

  match 'tasks/edit/:id',     to: 'tasks#edit',            via: 'get'
  match 'tasks/check/:id',    to: 'tasks#check',           via: 'get'
  match 'tasks/uncheck/:id',  to: 'tasks#uncheck',         via: 'get'
end
