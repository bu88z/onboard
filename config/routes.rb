Onboard::Application.routes.draw do

# to fit in with omniauth's callsback urls
get "/auth/:provider/callback" => "social_logins#create"
# :provider changes

 # static pages
 # also initialized automatically when generating views in command window

 # get "/about" => "contents#about"
 # get "/privacy" => "contents#privacy"
 # get "/terms-and-conditions" => "contents#terms"

 # Accessing Hashs
 # { name: "rik", email: "rik@steer.me"}
 # { :name => "rik", :email => "rik@steer.me"}

#this is where our URLs of our webapp are set
resources :users #, path: "signups" would change the url
resources :jobs do
	resources :submissions #we know who the current user is, don't need it in url
	resource :payment #singular, because I only want to have them pay once
end

# because i don't want to login twice as a user
# lets use a singular resource
resource :session

root "jobs#index"

end
