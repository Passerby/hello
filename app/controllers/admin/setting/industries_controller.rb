class Admin::Setting::IndustriesController < ApplicationController
  before_action :set_admin_setting_industry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_jobposter!
  layout 'admin'
  # GET /admin/setting/industries
  # GET /admin/setting/industries.json
  def index
    @admin_setting_industries = Admin::Setting::Industry.all
  end

  # GET /admin/setting/industries/1
  # GET /admin/setting/industries/1.json
  def show
  end

  # GET /admin/setting/industries/new
  def new
    @admin_setting_industry = Admin::Setting::Industry.new
  end

  # GET /admin/setting/industries/1/edit
  def edit
  end

  # POST /admin/setting/industries
  # POST /admin/setting/industries.json
  def create
    @admin_setting_industry = Admin::Setting::Industry.new(admin_setting_industry_params)

    respond_to do |format|
      if @admin_setting_industry.save
        flash[:notice] = '创建成功'
        format.html { redirect_to action:'index' }
     #   format.html { redirect_to @admin_setting_industry, notice: 'Industry was successfully created.' }
        format.json { render :show, status: :created, location: @admin_setting_industry }
      else
        format.html { render :new }
        format.json { render json: @admin_setting_industry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/setting/industries/1
  # PATCH/PUT /admin/setting/industries/1.json
  def update
    respond_to do |format|
      if @admin_setting_industry.update(admin_setting_industry_params)
        flash[:notice] = '更新成功'
        format.html { redirect_to action:'index' }
      #  format.html { redirect_to @admin_setting_industry, notice: 'Industry was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_setting_industry }
      else
        format.html { render :edit }
        format.json { render json: @admin_setting_industry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/setting/industries/1
  # DELETE /admin/setting/industries/1.json
  def destroy
    @admin_setting_industry.destroy
    respond_to do |format|
      format.html { redirect_to admin_setting_industries_url, notice: 'Industry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_setting_industry
      @admin_setting_industry = Admin::Setting::Industry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_setting_industry_params
      params.require(:admin_setting_industry).permit(:name,:en)
    end
end
