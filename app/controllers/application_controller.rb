class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # lets make a custom method that finds the user in the db
  # based on the session[:user_id]

  def current_user

  	if session[:user_id].present?
  		User.find(session[:user_id])
  	end
  	
  end

  # so we want to make this available to the views as well as the controllers
  helper_method :current_user

  # lets add in some authorization
  def require_user
    if current_user.nil?
        flash[:error] = "You must be a user to view this page"
        redirect_to new_user_path
      end
  end

end
