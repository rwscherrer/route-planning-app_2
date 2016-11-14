class JobsController < ApplicationController
  attr_accessor :job_id, :duration

  before_action :authenticate_user!

  def index

    @jobs = Job.order(:in_progress, :last_service_date)
    @job_id = Job.find_by(id: params[:id])

    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search_term]
    category = params[:category]


    if category 
      @jobs = Category.find_by(name: category).jobs
    end
  

    if search_term
      fuzzy_search_term = "%#{search_term}%"
      @jobs = @jobs.where("name ILIKE ? OR address_1 ILIKE ? OR city ILIKE ?", fuzzy_search_term, fuzzy_search_term, fuzzy_search_term)
    end

    if sort_attribute && sort_order
      @jobs = @jobs.order(sort_attribute => sort_order)
    elsif sort_attribute 
      @jobs = @jobs.order(sort_attribute)
    end

    def days_between
      if last_service_date
        calc = (last_service_date - Time.now) * -1
        @days_between = calc / 86400
      else
        0
      end


    end

  end

  def show
    @job = Job.find_by(id: params[:id])

  end

  def new
  end

  def create
    @job = Job.create(name: params[:name], address_1: params[:address_1], city: params[:city], state: params[:state], zip: params[:zip], email: params[:email], phone_number: params[:phone_number], user_id: current_user.id, duration: params[:duration])

    flash[:success] = "Job Created"
    redirect_to "/jobs/#{@job_id}"
  end

  def edit
    @job = Job.find_by(id: params[:id])
  end

  def update
    @job = Job.find_by(id: params[:id])
    @job.update(name: params[:name], address_1: params[:address_1], city: params[:city], state: params[:state], zip: params[:zip], email: params[:email], phone_number: params[:phone_number], duration: params[:duration])

    flash[:success] = "Job Updated"
    redirect_to "/#{@job_id}"
  end

  def destroy
    @job = Job.find_by(id: params[:id])
    @job.destroy

    flash[:success] = "Job Deleted"
    redirect_to "/jobs"
  end






end
