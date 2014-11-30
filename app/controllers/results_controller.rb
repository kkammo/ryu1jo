class ResultsController < ApplicationController
  before_action :set_result, only: [:show]
  before_filter :require_sign_in

  # GET /results
  def index
    @results = Result.all
  end

  # GET /results/1
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # POST /results
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
      else
        format.html { render :new }
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
