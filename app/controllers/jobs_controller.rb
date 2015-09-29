class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :new, :edit, :destroy]
  before_action :user_signed_in?, only: [:create, :update, :new, :edit, :destroy]

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @user = User.find(current_user.id)
    @job = Job.create(job_params)
    @user.jobs << @job
    redirect_to jobs_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
    redirect_to jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
