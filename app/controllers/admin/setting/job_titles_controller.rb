class Admin::Setting::JobTitlesController < ApplicationController
  before_action :set_admin_setting_job_title, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_jobposter!
  # GET /admin/setting/job_titles
  # GET /admin/setting/job_titles.json
  def index
    @admin_setting_job_titles = Admin::Setting::JobTitle.all
  end

  # GET /admin/setting/job_titles/1
  # GET /admin/setting/job_titles/1.json
  def show
  end

  # GET /admin/setting/job_titles/new
  def new
    @admin_setting_job_title = Admin::Setting::JobTitle.new
  end

  # GET /admin/setting/job_titles/1/edit
  def edit
  end

  # POST /admin/setting/job_titles
  # POST /admin/setting/job_titles.json
  def create
    @admin_setting_job_title = Admin::Setting::JobTitle.new(admin_setting_job_title_params)

    respond_to do |format|
      if @admin_setting_job_title.save
        format.html { redirect_to @admin_setting_job_title, notice: 'Job title was successfully created.' }
        format.json { render :show, status: :created, location: @admin_setting_job_title }
      else
        format.html { render :new }
        format.json { render json: @admin_setting_job_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/setting/job_titles/1
  # PATCH/PUT /admin/setting/job_titles/1.json
  def update
    respond_to do |format|
      if @admin_setting_job_title.update(admin_setting_job_title_params)
        format.html { redirect_to @admin_setting_job_title, notice: 'Job title was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_setting_job_title }
      else
        format.html { render :edit }
        format.json { render json: @admin_setting_job_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/setting/job_titles/1
  # DELETE /admin/setting/job_titles/1.json
  def destroy
    @admin_setting_job_title.destroy
    respond_to do |format|
      format.html { redirect_to admin_setting_job_titles_url, notice: 'Job title was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_setting_job_title
      @admin_setting_job_title = Admin::Setting::JobTitle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_setting_job_title_params
      params.require(:admin_setting_job_title).permit(:name, :admin_setting_industy_id)
    end
end
