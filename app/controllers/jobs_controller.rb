class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_jobposter!, :except => [:show, :last]
  before_action :split_cities, only: [:update, :create]
  before_action :split_industries, only: [:update, :create]

  # GET /jobs
  # GET /jobs.json
  def index
    @tasks_grid = initialize_grid(
      Job.eager_load(:city).eager_load(:company).eager_load(:jobposter)
        .select('jobs.*, (select COUNT(1) from applications where applications.job_id = jobs.id) AS applications_count'),
      order: 'jobs.id',
      order_direction: 'desc',
      custom_order: {
        'applications.id' => 'applications_count'
      },
      per_page: 20
    )
    render layout: "admin"
  end

  def last
    @jobs = Job.search_city(params[:city_name]).search_industry(params[:industry_id]).search(params[:keywords]).page(params[:page]).order(id: :desc)
    @job = @jobs[0]
    if params[:page]
      @page = params[:page]
    else
      @page = "1"
    end
    render 'jobs/show'
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @jobs = Job.search_city(params[:city_name]).search_industry(params[:industry_id]).search(params[:keywords]).page(params[:page]).order(id: :desc)

    if params[:page]
      @page = params[:page]
    else
      @page = "1"
    end
  end

  # GET /jobs/new
  def new
    @job = Job.new
    render layout: "admin"
  end

  # GET /jobs/1/edit
  def edit
    render layout: "admin"
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.jobposter_id = current_jobposter.id
    @job.cities = @cities if @cities.present?
    @job.industries = @industries if @industries.present?
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, layout: "admin" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  #  render layout: "admin"
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      @job.cities = @cities
      @job.industries = @industries
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, layout: "admin" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
#    render layout: "admin"
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.update(active: false)
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:title, :salary, :description, :requirement, :comment, :end_date, :company_id, :jobposter_id, :adjob)
  end

  def split_cities
    @cities = []
    if params["hidden-cities"].present?
      @cities = Admin::Setting::City.where(name: params["hidden-cities"].split(","))
    end
  end

  def split_industries
    @industries = []
    if params["hidden-industries"].present?
      @industries = Admin::Setting::Industry.where(name: params["hidden-industries"].split(","))
    end
  end
end
