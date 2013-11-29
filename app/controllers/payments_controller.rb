class PaymentsController < ApplicationController
  
before_action :require_user

  	def new
  		@job = current_user.jobs.find(params[:job_id])
  	end

	def create
		@job = current_user.jobs.find(params[:job_id]) #gets job id from URL (!!!)

		@job.stripe_token = params[:payment][:token] #gets the other info from form
		# how params come through from the frontend: params = { payment: {token: 234523454325}}
	
	if @job.save

		# charge this card
		Stripe::Charge.create(amount: 100, currency: "gbp", 
			card: @job.stripe_token, description: "Job id: #{@job.id}") #e.g. also order.price as charged amount

		#
		# Stripe::Customer.create(card: @job.stripe.token, description: "Job id: #{@job.id}", plan: "gold")
		# You make the plan up in the dashboard on the stripe site


		flash[:success] = "Your job is now featured"

	end

	redirect_to job_path(@job)

	end

end
