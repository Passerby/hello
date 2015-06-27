class Admin::Setting::ExperiencesController < ApplicationController
  before_action :set_admin_setting_experience, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_jobposter!
  layout 'admin'
  # GET /admin/setting/experiences
  # GET /admin/setting/experiences.json
  def index
    @admin_setting_experiences = Admin::Setting::Experience.all
  end

  # GET /admin/setting/experiences/1
  # GET /admin/setting/experiences/1.json
  def show
  end

  # GET /admin/setting/experiences/new
  def new
    @admin_setting_experience = Admin::Setting::Experience.new
  end

  # GET /admin/setting/experiences/1/edit
  def edit
  end

  # POST /admin/setting/experiences
  # POST /admin/setting/experiences.json
  def create
    @admin_setting_experience = Admin::Setting::Experience.new(admin_setting_experience_params)

    respond_to do |format|
      if @admin_setting_experience.save
        format.html { redirect_to @admin_setting_experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @admin_setting_experience }
      else
        format.html { render :new }
        format.json { render json: @admin_setting_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/setting/experiences/1
  # PATCH/PUT /admin/setting/experiences/1.json
  def update
    respond_to do |format|
      if @admin_setting_experience.update(admin_setting_experience_params)
        format.html { redirect_to @admin_setting_experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_setting_experience }
      else
        format.html { render :edit }
        format.json { render json: @admin_setting_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/setting/experiences/1
  # DELETE /admin/setting/experiences/1.json
  def destroy
    @admin_setting_experience.destroy
    respond_to do |format|
      format.html { redirect_to admin_setting_experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_setting_experience
      @admin_setting_experience = Admin::Setting::Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_setting_experience_params
      params.require(:admin_setting_experience).permit(:name)
    end
end
