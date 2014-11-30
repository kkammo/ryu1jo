class AdminController < ApplicationController
  def index
  end

  def developers
  	@developers = Developer.all
  end

  def evaluations
  	@evaluations = Evaluation.all
  end

  def evaluation
  	@evaluation = Evaluation.find(params[:id])
    @applieds = @evaluation.applieds
    @mappings = @evaluation.mappings
  end
  
end
