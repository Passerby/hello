class Admin::Setting::CitiesController < ApplicationController
  before_action :set_admin_setting_city, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_jobposter!
  layout 'admin'
  # GET /admin/setting/cities
  # GET /admin/setting/cities.json
  def index
    @admin_setting_cities = Admin::Setting::City.all
  end

  # GET /admin/setting/cities/1
  # GET /admin/setting/cities/1.json
  def show
  end

  # GET /admin/setting/cities/new
  def new
    @admin_setting_city = Admin::Setting::City.new
  end

  # GET /admin/setting/cities/1/edit
  def edit
  end

  # POST /admin/setting/cities
  # POST /admin/setting/cities.json
  def create
    @admin_setting_city = Admin::Setting::City.new(admin_setting_city_params)
#binding.pry
    respond_to do |format|
      if @admin_setting_city.save
        format.html { redirect_to @admin_setting_city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @admin_setting_city }
      else
        format.html { render :new }
        format.json { render json: @admin_setting_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/setting/cities/1
  # PATCH/PUT /admin/setting/cities/1.json
  def update
    respond_to do |format|
      if @admin_setting_city.update(admin_setting_city_params)
        format.html { redirect_to @admin_setting_city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_setting_city }
      else
        format.html { render :edit }
        format.json { render json: @admin_setting_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/setting/cities/1
  # DELETE /admin/setting/cities/1.json
  def destroy
    @admin_setting_city.destroy
    respond_to do |format|
      format.html { redirect_to admin_setting_cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_setting_city
      @admin_setting_city = Admin::Setting::City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_setting_city_params
      params.require(:admin_setting_city).permit(:name, :en,:admin_setting_province_id)
    end
end
