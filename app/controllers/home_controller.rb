class HomeController < ApplicationController
	
	# def index
	# 	my_selecteds = Selected.where(developer_id: current_developer.id)
	# 	mappings = []
	# 	for i in 0..my_selecteds.count-1
	# 		mappings += Mapping.where(rater_group_id: my_selecteds[i].rater_group_id)
	# 	end

	# 	applieds = []
	# 	for i in 0..mappings.count-1
	# 		applieds += Applied.where(ratee_group_id: mappings[i].ratee_group_id)
	# 	end

	# 	@jobs = []
	# 	for i in 0..applieds.count-1
	# 		@jobs += Material.where(developer_id: applieds[i].developer_id)
	# 	end
	# end

	def index
		evals = Evaluation.where(appliable: false, processed: false)
		if evals.count == 1
			@eval = evals[0]
			selected = Selected.where(developer_id: current_developer.id, evaluation_id: @eval.id)
			if selected.count == 1
				mappings = Mapping.where(rater_group_id: selected[0].rater_group_id)
				applieds = []
				for i in 0..mappings.count-1
					applieds += Applied.where(ratee_group_id: mappings[i].ratee_group_id)
				end

				@jobs = []
				for i in 0..applieds.count-1
					@jobs += Material.where(developer_id: applieds[i].developer_id)
				end

				results = Result.where(evaluation_id: @eval.id)
				resulted_materials = []
				for i in 0..results.count-1
					resulted_materials += [Material.find(results[i].material_id)]
				end
				@jobs = @jobs - resulted_materials
			end
		end
	end

end
