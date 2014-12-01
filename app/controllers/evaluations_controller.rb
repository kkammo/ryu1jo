class EvaluationsController < ApplicationController
  # before_filter :require_sign_in
  # before_filter :require_admin, only: [:new, :create, :map, :close]

	def index
		@evaluations = Evaluation.all.order('id ASC')
	end

	def show
		@evaluation = Evaluation.find(params[:id])
    @mappings = @evaluation.mappings
    @selected = Selected.where(evaluation_id: @evaluation.id, developer_id: current_developer.id)[0]
    if @selected
      @rater_group = @selected.rater_group
      @mapped_groups = @rater_group.mappings
    end
	end

	def new
		@evaluation = Evaluation.new
	end

	def create
		@evaluation = Evaluation.create()

		respond_to do |format|
      if @evaluation.save
        if current_developer.admin
          format.html { redirect_to admin_evaluation_path(:id => @evaluation.id), notice: 'created'}
        else
      	 format.html { redirect_to evaluation_path(@evaluation), notice: 'created'}
        end
      else
        format.html{ render action: "new"}  
      end
    end
  end

  def close
    @evaluation = Evaluation.find(params[:id])
    if @evaluation
      @evaluation.processed = true
      if @evaluation.save
        redirect_to admin_evaluation_path(:id => @evaluation.id)
      else
        redirect_to admin_evaluation_path(:id => @evaluation.id)
      end
    else
      admin_evaluations_path
    end
  end

  def apply
    @evaluation = Evaluation.find(params[:id])
    
    if Applied.where(evaluation_id: @evaluation.id, developer_id: current_developer.id).count==0
      @applied = @evaluation.applieds.new
      @applied.developer_id = current_developer.id
      if @applied.save
        redirect_to evaluation_path(@evaluation), notice: '신청이 정상적으로 처리되었습니다.'
      else
        redirect_to evaluation_path(@evaluation), notice: '신청이 취소되었습니다.'
      end
    else
      redirect_to evaluation_path(@evaluation), notice: '이미 신청하셨습니다.'
    end
  end

  def map
    @evaluation = Evaluation.find(params[:id])

    if @evaluation.appliable && (@evaluation.processed==false)
      if params[:rateemem] && params[:ratermem]
      if (params[:rateemem].to_i > 0) && (params[:ratermem].to_i > 0)
        num_of_appliers = @evaluation.applieds.count
        num_of_selecteds = num_of_appliers/2
        if num_of_appliers==1
          num_of_selecteds+=1
        end


        total_ratee_groups = num_of_appliers/params[:rateemem].to_i
        total_rater_groups = num_of_selecteds/params[:ratermem].to_i

        if (num_of_appliers%params[:rateemem].to_i)!=0
          total_ratee_groups += 1
        end

        if (num_of_selecteds%params[:ratermem].to_i)!=0
          total_rater_groups += 1
        end


        if total_ratee_groups < total_rater_groups
          redirect_to admin_evaluation_path(:id => @evaluation.id)
        end

        selected_developers = Developer.where(admin: false).order("RANDOM()").first(num_of_selecteds)

        selected_developers.each do |developer|
          @evaluation.selecteds.create(developer_id: developer.id)
        end

        for i in 1..total_ratee_groups
          @evaluation.ratee_groups.create
        end

        for i in 1..total_rater_groups
          @evaluation.rater_groups.create
        end

        #mapping
        rateegroups = @evaluation.ratee_groups
        ratergroups = @evaluation.rater_groups

        for i in 0..(total_ratee_groups-1)
          @evaluation.mappings.create(ratee_group_id: rateegroups[i].id,
           rater_group_id: rateegroups[i%total_rater_groups].id)
        end


        # algorithm

        case_counter = 0
        begin

          case_counter += 1

          applieds = @evaluation.applieds.order("RANDOM()").first(num_of_appliers)
          selecteds = @evaluation.selecteds.order("RANDOM()").first(num_of_selecteds)
         
          
          for i in 0..(applieds.count-1)
            applieds[i].ratee_group_id = rateegroups[i/params[:rateemem].to_i].id
          end

          dev_selector = 0
          group_selector = 0
          loop_counter = 0

          begin
            loop_counter += 1
            puts "======================"
            puts "#{loop_counter}"
            puts "======================"

            if selecteds[dev_selector%num_of_selecteds].rater_group_id != nil
              dev_selector += 1
              next
            end

            mapped_ratee_group = Mapping.where(rater_group_id: ratergroups[group_selector%total_rater_groups].id)

            next_dev_flag = false
            finish_flag = false

            for j in 0..(mapped_ratee_group.count-1)
              mapped_ratee_dev = []
              for h in 0..(applieds.count-1)
                if applieds[h].ratee_group_id == mapped_ratee_group[j].ratee_group_id
                  mapped_ratee_dev << applieds[h]
                end
              end
              # mapped_ratee_dev = applieds.where(ratee_group_id: mapped_ratee_group[j].ratee_group_id)
              for k in 0..(mapped_ratee_dev.count-1)
                if mapped_ratee_dev[k].developer_id == selecteds[dev_selector%num_of_selecteds].developer_id
                  next_dev_flag = true
                end
              end
            end

            if next_dev_flag == true
              dev_selector += 1
              next
            end

            selecteds[dev_selector%num_of_selecteds].rater_group_id = ratergroups[group_selector%total_rater_groups].id
            dev_selector += 1
            group_selector += 1


            finish_flag = true
            for x in 0..(selecteds.count-1)
              if selecteds[x].rater_group_id == nil
                  finish_flag = false
              end          
            end
          end while (finish_flag == false)&&(loop_counter <= (num_of_selecteds*total_rater_groups))

        end while (finish_flag == false)&&(case_counter<5000)


        for l in 0..(selecteds.count-1)
          if selecteds[l].rater_group_id == nil
            selecteds[l].rater_group_id = ratergroups[group_selector%total_rater_groups].id
            group_selector += 1
          end          
        end

        # save db
        for u in 0..(selecteds.count-1)
          selecteds[u].save
        end

        for v in 0..(applieds.count-1)
          applieds[v].save
        end


      end
    end
    redirect_to admin_evaluation_path(:id => @evaluation.id)
  end

  private
  def set_map_params

  end

end
