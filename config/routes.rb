Rails.application.routes.draw do
  resources :matches
  resources :age_preferences
  resources :preferences
  resources :likes
  resources :profils
  resources :lovers
  resources :users
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login" => "login#show"
  get "/login/logout" => "login#logout"
  post "/login/send" => "login#send_data"

  get "/register" => "register#show"
  post "/register/send" => "register#send_data"

  get "/space" => "space#index"
  get "/space/myprofil/:id" , to:  "profils#show" , as: 'space_myprofil'
  get "/space/myprofil/edit/:id" , to:  "profils#edit" , as: 'space_editprofil'
  get "/space/profil/:id" , to:  "profils#show" , as: 'space_profil'
  get "/space/create/profil" , to:  "profils#new" , as: 'space_newprofil'

  get "/space/messages" , to:  "messages#index" , as: 'space_message'
  get "/space/messages/new/:id" , to:  "messages#new" , as: 'space_newmessage'


  root "home#index", page: "home"
end
