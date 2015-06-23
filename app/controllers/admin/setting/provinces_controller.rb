class Admin::Setting::ProvincesController < ApplicationController
  before_action :set_admin_setting_province, only: [:show, :edit, :update, :destroy]

  # GET /admin/setting/provinces
  # GET /admin/setting/provinces.json
  def index
    @admin_setting_provinces = Admin::Setting::Province.all
  end

  # GET /admin/setting/provinces/1
  # GET /admin/setting/provinces/1.json
  def show
  end

  # GET /admin/setting/provinces/new
  def new
    @admin_setting_province = Admin::Setting::Province.new
  end

  # GET /admin/setting/provinces/1/edit
  def edit
  end

  # POST /admin/setting/provinces
  # POST /admin/setting/provinces.json
  def create
    @admin_setting_province = Admin::Setting::Province.new(admin_setting_province_params)

    respond_to do |format|
      if @admin_setting_province.save
        format.html { redirect_to @admin_setting_province, notice: 'Province was successfully created.' }
        format.json { render :show, status: :created, location: @admin_setting_province }
      else
        format.html { render :new }
        format.json { render json: @admin_setting_province.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/setting/provinces/1
  # PATCH/PUT /admin/setting/provinces/1.json
  def update
    respond_to do |format|
      if @admin_setting_province.update(admin_setting_province_params)
        format.html { redirect_to @admin_setting_province, notice: 'Province was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_setting_province }
      else
        format.html { render :edit }
        format.json { render json: @admin_setting_province.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/setting/provinces/1
  # DELETE /admin/setting/provinces/1.json
  def destroy
    @admin_setting_province.destroy
    respond_to do |format|
      format.html { redirect_to admin_setting_provinces_url, notice: 'Province was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_setting_province
      @admin_setting_province = Admin::Setting::Province.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_setting_province_params
      params.require(:admin_setting_province).permit(:name, :pinyin)
    end
end
