class JobsController < ApplicationController
  
	#the user must be signed in for everything apart from the index and show
	before_action :require_user, except: [:index, :show] #:index and also require user are symbols, not changing

  def index
  	@jobs = Job.all
  	# if i wanted to find all of my jobs
  	# @jobs = current_user.jobs.all
  end

  def show
  	# not current_user.jobs because it can be anyones job
  	@job = Job.find(params[:id])
  end

  def new
  	# @job = Job.new
  	# because we want the job attached to a user
  	@job = current_user.jobs.new 
  	# current_user is the method we set up yesterday in the application controller
  	# similar category.links.new
  end

  def create
  	@job = current_user.jobs.new(job_params) #from the form, whitelist the things which are added, no html manipulation

  	if @job.save
    		flash[:success] = "Job added"
  		redirect_to job_path(@job)
  	else
  		render :new
  	end
  end

  def edit #form page
  	@job = current_user.jobs.find(params[:id]) #not going to find jobs of other users. User model > jobs model
  end

  def update #action for data, another page
  	@job = current_user.jobs.find(params[:id]) 

  	if @job.update(job_params)
  		flash[:success] = "Job updated"
  		redirect_to job_path(@job)
  	else
  		render :edit
  	end

  end


  def destroy
  	@job = current_user.jobs.find(params[:id]) 
  	@job.destroy
  	flash[:success] = "Job deleted"
  	redirect_to root_path #can't go back to the job page since it was just deleted
  end


  def job_params
  	params.require(:job).permit(:title, :description, :company_name, :company_url, :company_tagline,
  		:location, :phone, :application_deadline, :salary)
  end

  
end
