class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	#new row in db with params form
  	@user = User.new(user_params)

  	if @user.save #returns true or false based on validations
  		#only if it passes validations tests
  		flash[:success] = "You've successfully signed up"

  		#tell the browser, that i am this user. Name user_id created by us

  		session[:user_id] = @user.id

  		redirect_to root_path
  	else
  		#render same website if it doesn't save
  		render :new
  	end
  end

  # whitelist the users inputs from the form
  # we want any hackers
  def user_params
  	params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end
