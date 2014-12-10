class ResultsController < ApplicationController
  before_action :set_result, only: [:show]
  before_filter :require_sign_in

  # GET /results
  def index
    @results = Result.all
  end

  # GET /results/1
  def show
    unless (@result.ratee_id == current_developer.id) ||
      (@result.rater_id == current_developer.id)
      redirect_to materials_path
      return
    else
      @material = Material.find(@result.material_id)
    end
  end

  # GET /results/new
  def new
    @material = Material.find(params[:material_id])

    if Evaluation.find(params[:evaluation_id]).processed
      redirect_to root_path, notice: '평가 가능 기간이 지났습니다.'
    end

    if Result.where(rater_id: current_developer.id, material_id: @material.id, evaluation_id: params[:evaluation_id]).count > 0
      redirect_to root_path, notice: '이미 평가하였습니다.'
    end

    if @material
      @result = Result.new(material_id: @material.id)
    end
  end

  # POST /results
  def create
    @material = Material.find(params[:result][:material_id])
    if @material.developer_id == current_developer.id
      redirect_to root_path, notice: '자신의 자료는 평가할 수 없습니다.'
      return
    end
    @result = Result.new(result_params)
    @result.value *= @material.prate
    @result.ratee_cname = Developer.find(params[:result][:ratee_id]).cname

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
      else
        format.html { redirect_to new_result_path(:material_id => params[:result][:material_id], :evaluation_id => params[:result][:evaluation_id])}
      end
    end
  end

  private
    def set_result
      @result = Result.find(params[:id])
    end

    def result_params
      params.require(:result).permit(:value, :ratee_id, :rater_id, :evaluation_id, :material_id)
    end
end
