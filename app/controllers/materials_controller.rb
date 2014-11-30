class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :destroy]
  # before_filter :require_sign_in

  # GET /materials
  def index
    @materials = Material.all
  end

  # GET /materials/1
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # POST /materials
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /materials/1
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_material
      @material = Material.find(params[:id])
    end

    def material_params
      params.require(:material).permit(:subject, :content, :field, :developer_id, :prate)
    end
end
