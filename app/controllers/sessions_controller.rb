class SessionsController < ApplicationController
	def new
		#this doesn't need a variable because its a placeholder form
	end

	def create
		# instructions
		# find the username and password from the form
		# then check if thers a user with that username
		# and if they have the same password as what was typed in
		# give them a session

		@username = params[:session][:username] #directly take from form
		@password = params[:session][:password] 

		@user = User.find_by_username(@username)

		if @user.present? and @user.authenticate(@password)

			#give them a session
			session[:user_id] = @user.id
			flash[:success] = "You've logged in successfully #{@user.name}" 
			redirect_to root_path

		else

			flash[:error] = "Log in failed"
			render :new
		
		end

	end


	def destroy
		# remove session [:user_id]
		reset_session
		flash[:success] = "you've logged out"
		redirect_to root_path
	end
end
