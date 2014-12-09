class CareerController < ApplicationController

	def index
		@careers = current_developer.careers
		@materials = current_developer.materials
		@received_results = Result.where(ratee_id: current_developer.id)
		@gived_results = Result.where(rater_id: current_developer.id)
		@applieds = current_developer.applieds
		@selecteds = current_developer.selecteds
	end

	def search
		_begin = DateTime.civil(*params[:begin].sort.map(&:last).map(&:to_i))
		_end = DateTime.civil(*params[:end].sort.map(&:last).map(&:to_i)).end_of_day
		
		case params[:format]

		when '1'
			case params[:period]

			when "today"
  			@careers = Career.where(created_at: Time.zone.now.all_day, developer_id: current_developer.id)
  		when "7days"
  			@careers = Career.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, developer_id: current_developer.id)
  		when "period"
  			@careers = Career.where(created_at: _begin.._end, developer_id: current_developer.id)
  		end
		when '2'
  		case params[:period]
				
			when "today"
  			@materials = Material.where(created_at: Time.zone.now.all_day, developer_id: current_developer.id)
  		when "7days"
  			@materials = Material.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, developer_id: current_developer.id)
  		when "period"
  			@materials = Material.where(created_at: _begin.._end, developer_id: current_developer.id)
  		end
		when '3'
  		case params[:period]
				
			when "today"
  			@received_results = Result.where(created_at: Time.zone.now.all_day, ratee_id: current_developer.id)
  		when "7days"
  			@received_results = Result.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, ratee_id: current_developer.id)
  		when "period"
  			@received_results = Result.where(created_at: _begin.._end, ratee_id: current_developer.id)
  		end
  	when '4'
  		case params[:period]
				
			when "today"
  			@gived_results = Result.where(created_at: Time.zone.now.all_day, rater_id: current_developer.id)
  		when "7days"
  			@gived_results = Result.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, rater_id: current_developer.id)
  		when "period"
  			@gived_results = Result.where(created_at: _begin.._end, rater_id: current_developer.id)
  		end
  	when '5'
  		case params[:period]
				
			when "today"
  			@applieds = Applied.where(created_at: Time.zone.now.all_day, developer_id: current_developer.id)
  		when "7days"
  			@applieds = Applied.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, developer_id: current_developer.id)
  		when "period"
  			@applieds = Applied.where(created_at: _begin.._end, developer_id: current_developer.id)
  		end
  	when '6'
			case params[:period]
				
			when "today"
  			@selecteds = Selected.where(created_at: Time.zone.now.all_day, developer_id: current_developer.id)
  		when "7days"
  			@selecteds = Selected.where(created_at: 7.days.ago.at_beginning_of_day..Time.now.at_end_of_day, developer_id: current_developer.id)
  		when "period"
  			@selecteds = Selected.where(created_at: _begin.._end, developer_id: current_developer.id)
  		end
		else
  		puts "params format is nil"
		end
		
	end

	def change_company
		@developer = Developer.find(params[:developer_id])

		if Company.where(name: params[:new_company].to_s).count > 0
			if @developer.cname == params[:new_company].to_s
				redirect_to edit_developer_registration_path(@developer), notice: '현재 회사와 동일합니다.'
				return
			end
			@career = @developer.careers.new(prev: @developer.cname, current: params[:new_company])
			@career.save
			@developer.cname = params[:new_company]
			@developer.save
			redirect_to edit_developer_registration_path(@developer), notice: '수정되었습니다.'
		else
			redirect_to edit_developer_registration_path(@developer), notice: '회사가 존재하지 않습니다.'
		end	
	end

	def change_department
		@developer = Developer.find(params[:developer_id])

		if Department.where(dname: params[:new_department].to_s, cname: @developer.cname).count > 0
			if @developer.dname == params[:new_department].to_s
				redirect_to edit_developer_registration_path(@developer), notice: '현재 회사와 동일합니다.'
				return
			end

			@career = @developer.careers.new(prev: @developer.dname, current: params[:new_department])
			@career.save
			@developer.dname = params[:new_department]
			@developer.save
			redirect_to edit_developer_registration_path(@developer), notice: '수정되었습니다.'
			return
		else
			redirect_to edit_developer_registration_path(@developer), notice: '부서가 존재하지 않습니다.'
			return
		end	
	end

	def change_field
		@developer = Developer.find(params[:developer_id])

		if params[:field].length > 0
			if @developer.field == params[:field].to_s
				redirect_to edit_developer_registration_path(@developer), notice: '현재 전문 분야와 동일합니다.'
				return
			end

			@career = @developer.careers.new(prev: @developer.field, current: params[:field])
			@career.save
			@developer.field = params[:field]
			@developer.save
			redirect_to edit_developer_registration_path(@developer), notice: '수정되었습니다.'
		else
			redirect_to edit_developer_registration_path(@developer), notice: '전문 분야가 존재하지 않습니다.'
		end
	end

end
