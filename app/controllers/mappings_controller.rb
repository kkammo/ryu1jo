class MappingsController < ApplicationController
  before_action :set_mapping, only: [:show]
  # before_filter :require_sign_in

  # GET /mappings
  # GET /mappings.json
  def index
    @mappings = Evaluation.find(params[:id]).mappings
  end

  # GET /mappings/1
  # GET /mappings/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mapping
      @mapping = Mapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def mapping_params
      # params[:mapping]
    # end
end
