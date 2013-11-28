Onboard::Application.routes.draw do
  
  get "jobs/index"
  get "jobs/show"
  get "jobs/new"
  get "jobs/edit"
#this is where our URLs of our webapp are set
resources :users
resources :jobs

# because i don't want to login twice as a user
# lets use a singular resource
resource :session

root "jobs#index"

end
