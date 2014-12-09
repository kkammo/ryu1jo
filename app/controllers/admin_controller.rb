class AdminController < ApplicationController
  before_filter :require_admin

  def index
  end

  def developers
  	@developers = Developer.all
  end

  def developer
    developer = Developer.where(email: params[:search])[0]

    _begin = DateTime.civil(*params[:begin].sort.map(&:last).map(&:to_i))
    _end = DateTime.civil(*params[:end].sort.map(&:last).map(&:to_i)).end_of_day
    
    unless developer
      redirect_to admin_developers_path
      return
    else

    case params[:format]

    when '1'
      case params[:period]

      when "today"
        @careers = Career.where(created_at: Time.zone.now.all_day, developer_id: developer.id)
      when "7days"
        @careers = Career.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, developer_id: developer.id)
      when "period"
        @careers = Career.where(created_at: _begin.._end, developer_id: developer.id)
      end
    when '2'
      case params[:period]
        
      when "today"
        @materials = Material.where(created_at: Time.zone.now.all_day, developer_id: developer.id)
      when "7days"
        @materials = Material.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, developer_id: developer.id)
      when "period"
        @materials = Material.where(created_at: _begin.._end, developer_id: developer.id)
      end
    when '3'
      case params[:period]
        
      when "today"
        @received_results = Result.where(created_at: Time.zone.now.all_day, ratee_id: developer.id)
      when "7days"
        @received_results = Result.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, ratee_id: developer.id)
      when "period"
        @received_results = Result.where(created_at: _begin.._end, ratee_id: developer.id)
      end
    when '4'
      case params[:period]
        
      when "today"
        @gived_results = Result.where(created_at: Time.zone.now.all_day, rater_id: developer.id)
      when "7days"
        @gived_results = Result.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, rater_id: developer.id)
      when "period"
        @gived_results = Result.where(created_at: _begin.._end, rater_id: developer.id)
      end
    when '5'
      case params[:period]
        
      when "today"
        @applieds = Applied.where(created_at: Time.zone.now.all_day, developer_id: developer.id)
      when "7days"
        @applieds = Applied.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, developer_id: developer.id)
      when "period"
        @applieds = Applied.where(created_at: _begin.._end, developer_id: developer.id)
      end
    when '6'
      case params[:period]
        
      when "today"
        @selecteds = Selected.where(created_at: Time.zone.now.all_day, developer_id: developer.id)
      when "7days"
        @selecteds = Selected.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, developer_id: developer.id)
      when "period"
        @selecteds = Selected.where(created_at: _begin.._end, developer_id: developer.id)
      end
    else
      puts "params format is nil"
    end
  end
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
    if params[:field] == "-1"
      @materials = Material.all
    elsif params[:field]
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
