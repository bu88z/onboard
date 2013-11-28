class SocialLoginsController < ApplicationController

	def create
		# this is all the info back from facebook or twitter or linkedin
		# omniauth standardizes feedback
		@omniauth = request.env['omniauth.auth']

		# just following how omniauth works
		@email = @omniauth["info"]["email"]
		@provider = @omniauth["provider"]
		@provider_id = @omniauth["uid"]
		@name = @omniauth["info"]["name"]

		@user = User.find_by_email(@email)


		if @user.present?

			# double check for correct email etc
			# if @provider == "facebook" and @user.facebook_id != @provider_id
			#	flash [:error] = "wrong"
			# end

			# they're already in the system
			flash[:success] = "Logged in successfully"
		else
			# add a new user
			@user = User.new
			@user.email = @email
			@user.name = @name
			# leave username blank
			@user.facebook_id = @provider_id if @provider == "facebook"
			@user.twitter_id = @provider_id if @provider == "twitter"
			@user.linkedin_id = @provider_id if @provider == "linkedin"

			@user.save!

			flash[:success] = "Signed up successfully"
		end

		session[:user_id] = @user.id
		redirect_to root_path

	end
end
