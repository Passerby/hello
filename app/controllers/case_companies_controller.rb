class CaseCompaniesController < ApplicationController
  before_action :set_case_company, only: [:show, :edit, :update, :destroy]

  # GET /case_companies
  # GET /case_companies.json
  def index
    @case_companies = CaseCompany.all
  end

  # GET /case_companies/1
  # GET /case_companies/1.json
  def show
  end

  # GET /case_companies/new
  def new
    @case_company = CaseCompany.new
  end

  # GET /case_companies/1/edit
  def edit
  end

  # POST /case_companies
  # POST /case_companies.json
  def create
    @case_company = CaseCompany.new(case_company_params)

    respond_to do |format|
      if @case_company.save
        format.html { redirect_to @case_company, notice: 'Case company was successfully created.' }
        format.json { render :show, status: :created, location: @case_company }
      else
        format.html { render :new }
        format.json { render json: @case_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_companies/1
  # PATCH/PUT /case_companies/1.json
  def update
    respond_to do |format|
      if @case_company.update(case_company_params)
        format.html { redirect_to @case_company, notice: 'Case company was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_company }
      else
        format.html { render :edit }
        format.json { render json: @case_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_companies/1
  # DELETE /case_companies/1.json
  def destroy
    @case_company.destroy
    respond_to do |format|
      format.html { redirect_to case_companies_url, notice: 'Case company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_company
      @case_company = CaseCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_company_params
      params.require(:case_company).permit(:name, :img, :requirement, :usage, :effect, :lang, :active)
    end
end
