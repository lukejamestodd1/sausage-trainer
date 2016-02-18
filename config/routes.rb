Rails.application.routes.draw do

  get "/" => "pages#splash"
  get "/login" => "pages#login"
  get "/sign-up" => "pages#sign_up"
  get "/about" => "pages#about"
  get "/home" => "pages#home"

  namespace :api do

    resources :users
    get '/users/:id/activities' => 'users#activities'
    get '/users/:id/contacts' => 'users#contacts_list'
    get '/users/:id/groups' => 'users#groups'
    resources :activities
    get '/activities/:id/participants' => 'activities#participants'
    resources :venues
    resources :groups
    get '/groups/:id/users' => 'groups#members'

  end
  
end
