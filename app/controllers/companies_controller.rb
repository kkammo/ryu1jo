class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :destroy]
  # before_filter :require_sign_in
  # before_filter :require_admin, only: [:new, :create, :map]

  # GET /companies
  def index
    @companies = Company.all
  end

  # GET /companies/1
  def show
    @departments = @company.departments
    @evaluations = Evaluation.all
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find(params[:name])
    end

    def company_params
      params.require(:company).permit(:name)
    end
end
