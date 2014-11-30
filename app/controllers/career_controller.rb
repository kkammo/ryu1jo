class CareerController < ApplicationController

	def change_company
		@developer = Developer.find(params[:developer_id])

		if Company.where(name: params[:new_company].to_s).count > 0
			if @developer.cname == params[:new_company].to_s
				redirect_to edit_developer_registration_path(@developer), notice: '현재 회사와 동일합니다.'
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
			end

			@career = @developer.careers.new(prev: @developer.dname, current: params[:new_department])
			@career.save
			@developer.dname = params[:new_department]
			@developer.save
			redirect_to edit_developer_registration_path(@developer), notice: '수정되었습니다.'
		else
			redirect_to edit_developer_registration_path(@developer), notice: '부서가 존재하지 않습니다.'
		end	
	end

end
