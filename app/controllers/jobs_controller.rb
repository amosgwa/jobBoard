class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		p "IN the Create method ========="
		job = Job.create(job_params)
		p job
		redirect_to jobs_path
	end
	
	def edit
	  @job = Job.find(params[:id])
	  puts @job
	end

	def update
		@job = Job.find(params[:id])
  	@job.update_attributes(job_params)
		redirect_to jobs_path
	end

	def destroy
		Job.find(params[:id]).destroy
		redirect_to jobs_path
	end

	def show
		@job = Job.find(params[:id])
	end
		
	private

	def job_params
		params.require(:job).permit(:title, :description)
	end

end
