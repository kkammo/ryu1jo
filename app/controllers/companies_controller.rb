class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :destroy]
  before_filter :require_sign_in
  before_filter :require_admin, only: [:new, :create]

  # GET /companies
  def index
    if params[:field]
      @companies = Company.all.sort_by {|company| company.get_field_avg(params[:field]) }.reverse
    else
      @companies = Company.all
    end
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
    if @company.name == "freelancer"
      redirect_to companies_url, notice: '이 회사는 삭제할 수 없습니다.'
      return
    end
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    redirect_to companies_path(:field => params[:field])
  end

  private
    def set_company
      @company = Company.find(params[:name])
    end

    def company_params
      params.require(:company).permit(:name)
    end
end
