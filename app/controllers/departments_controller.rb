class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :destroy]
  # before_filter :require_sign_in
  # before_filter :require_admin, only: [:new, :create, :map]

  # GET /companies/#/departments
  def index
    @departments = Company.find(params[:company_name]).departments
  end

  # GET /companies/#/departments/#
  def show
  end

  # GET /companies/#/departments/new
  def new
    @company = Company.find(params[:company_name])
    @department = Company.find(params[:company_name]).departments.new
  end

  # POST /companies/#/departments
  def create
    @company = Company.find(params[:company_name])
    @department = Company.find(params[:company_name]).departments.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to company_department_path(@company, @department), notice: 'Department was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /companies/#/departments/#
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_department
      @department = Department.find(params[:dname_cname])
    end

    def department_params
      params.require(:department).permit(:dname, :cname)
    end
end
