class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_jobposter!, :except => [:show, :index]
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    render layout: "admin"
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @jobs = Job.all
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

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  #  render layout: "admin"
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
#    render layout: "admin"
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
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
      params.require(:job).permit(:title, :salary, :description, :requirement, :comment, :endDate, :admin_setting_city_id, :company_id, :jobposter_id)
    end
end
