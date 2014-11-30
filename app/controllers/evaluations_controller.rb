class EvaluationsController < ApplicationController
  # before_filter :require_sign_in
  # before_filter :require_admin, only: [:new, :create, :map]

	def index
		@evaluations = Evaluation.all
	end

	def show
		@evaluation = Evaluation.find(params[:id])
    @mappings = @evaluation.mappings
	end

	def new
		@evaluation = Evaluation.new
	end

	def create
		@evaluation = Evaluation.create()

		respond_to do |format|
      if @evaluation.save
      	format.html { redirect_to evaluation_path(@evaluation), notice: 'created'}
      else
        format.html{ render action: "new"}  
      end
    end
  end

  def map
  	@evaluation = Evaluation.find(params[:id])

  	# unless @evaluation.appliable && @evaluation.processed
  		if params[:rateemem] && params[:ratermem]
  		if (params[:rateemem].to_i > 0) && (params[:ratermem].to_i > 0)
  			num_of_appliers = @evaluation.applieds.count

  			total_ratee_groups = num_of_appliers/params[:rateemem].to_i
  			total_rater_groups = (num_of_appliers/2)/params[:ratermem].to_i

  			if num_of_appliers%params[:rateemem].to_i
  				total_ratee_groups += 1
  			end
  			if num_of_appliers%params[:ratermem].to_i
  				total_rater_groups += 1
  			end

  			if total_ratee_groups < total_rater_groups
					redirect_to evaluation_path(@evaluation)
				end

   			selected_developers =
   				Developer.where(admin: false).order("RANDOM()").first(num_of_appliers/2)

   			selected_developers.each do |developer|
   				@evaluation.selecteds.create(developer_id: developer.id)
   			end

  			for i in 1..total_ratee_groups
   				@evaluation.ratee_groups.create
				end

				for i in 1..total_rater_groups
   				@evaluation.rater_groups.create
				end

				applieds = @evaluation.applieds.order("RANDOM()").first(num_of_appliers)
				selecteds = @evaluation.selecteds.order("RANDOM()").first(num_of_appliers/2)
				rateegroups = @evaluation.ratee_groups
				ratergroups = @evaluation.rater_groups

				#mapping
				for i in 0..(total_ratee_groups-1)
					@evaluation.mappings.create(ratee_group_id: rateegroups[i].id,
					 rater_group_id: rateegroups[i%total_rater_groups].id)
				end

				for i in 0..(applieds.count-1)
					puts "i: #{i}"
					applieds[i].ratee_group_id = rateegroups[i%total_ratee_groups].id
					applieds[i].save
				end

				for i in 0..(selecteds.count-1)
					selecteds[i].rater_group_id = ratergroups[i%total_rater_groups].id
					selecteds[i].save
				end

  		end
  	end
  # end
  	redirect_to root_path
  end

  private
  def set_map_params

  end

end
