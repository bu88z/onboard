Onboard::Application.routes.draw do
  
  get "jobs/index"
  get "jobs/show"
  get "jobs/new"
  get "jobs/edit"
#this is where our URLs of our webapp are set
resources :users
resources :jobs



root "jobs#index"

end
