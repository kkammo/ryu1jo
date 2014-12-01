class AdminController < ApplicationController
  def index
  end

  def developers
  	@developers = Developer.all
  end

  def evaluations
  	@evaluations = Evaluation.all.order('id ASC')
  end

  def evaluation
  	@evaluation = Evaluation.find(params[:id])
    @applieds = @evaluation.applieds
    @mappings = @evaluation.mappings
  end

  def materials
    if params[:field]
      @materials = Material.where(field: params[:field])
    else
      @materials = Material.all
    end
  end
  
  def material
    @material = Material.find(params[:id])
    @results = Result.where(material_id: @material.id)
  end

end
