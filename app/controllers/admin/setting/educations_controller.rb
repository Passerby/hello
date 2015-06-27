class Admin::Setting::EducationsController < ApplicationController
  before_action :set_admin_setting_education, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_jobposter!
  layout 'admin'
  # GET /admin/setting/educations
  # GET /admin/setting/educations.json
  def index
    @admin_setting_educations = Admin::Setting::Education.all
  end

  # GET /admin/setting/educations/1
  # GET /admin/setting/educations/1.json
  def show
  end

  # GET /admin/setting/educations/new
  def new
    @admin_setting_education = Admin::Setting::Education.new
  end

  # GET /admin/setting/educations/1/edit
  def edit
  end

  # POST /admin/setting/educations
  # POST /admin/setting/educations.json
  def create
    @admin_setting_education = Admin::Setting::Education.new(admin_setting_education_params)

    respond_to do |format|
      if @admin_setting_education.save
        format.html { redirect_to @admin_setting_education, notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: @admin_setting_education }
      else
        format.html { render :new }
        format.json { render json: @admin_setting_education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/setting/educations/1
  # PATCH/PUT /admin/setting/educations/1.json
  def update
    respond_to do |format|
      if @admin_setting_education.update(admin_setting_education_params)
        format.html { redirect_to @admin_setting_education, notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_setting_education }
      else
        format.html { render :edit }
        format.json { render json: @admin_setting_education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/setting/educations/1
  # DELETE /admin/setting/educations/1.json
  def destroy
    @admin_setting_education.destroy
    respond_to do |format|
      format.html { redirect_to admin_setting_educations_url, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_setting_education
      @admin_setting_education = Admin::Setting::Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_setting_education_params
      params.require(:admin_setting_education).permit(:name,:en)
    end
end
