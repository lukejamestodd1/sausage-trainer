Rails.application.routes.draw do

  get "/" => "pages#splash"
  get "/login" => "pages#login"
  post "/login" => "session#create"
  get "/logout" => "session#destroy"
  get "/sign-up" => "pages#sign_up"
  post "/sign-up" => "users#create"
  get "/about" => "pages#about"
  get "/home" => "pages#home"

  namespace :api do

    resources :users
    get '/users/:id/activities' => 'users#activities'
    get '/users/:id/contacts' => 'users#contacts_list'
    get '/users/:id/groups' => 'users#groups'
    get '/session' => 'users#current'
    resources :activities
    get '/activities/:id/participants' => 'activities#participants'
    resources :venues
    resources :groups
    get '/groups/:id/users' => 'groups#members'

  end

end
