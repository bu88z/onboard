Onboard::Application.routes.draw do

# to fit in with omniauth's callsback urls
get "/auth/:provider/callback" => "social_logins#create"
# :provider changes

  

#this is where our URLs of our webapp are set
resources :users
resources :jobs

# because i don't want to login twice as a user
# lets use a singular resource
resource :session

root "jobs#index"

end
