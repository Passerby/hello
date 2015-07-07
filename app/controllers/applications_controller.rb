class ApplicationsController < ApplicationController
  layout 'admin'
  def create
    @application = Application.new(application_params)
    if user_signed_in?
    	@application.user_id = current_user.id
    else
    
    end

   # @application.user
    respond_to do |format|
      if @application.save
        format.html { redirect_to applications_path, notice: 'Application was successfully created.' }
        format.js   {}
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    job_id = params[:job_id]
  	@applications = Application.where(job_id: job_id)
    @path = Rails.application.config.resumePath
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:job_id, :resume_id)
    end

end
