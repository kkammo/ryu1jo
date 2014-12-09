class Company < ActiveRecord::Base
	self.primary_key = :name
	has_many :departments, foreign_key: :cname, primary_key: :name
	has_many :developers, foreign_key: :cname, primary_key: :name

	public
		def get_avg(evaluation_id)
			results = Result.where(evaluation_id: evaluation_id, ratee_cname: self.name)

			if results.count > 0
				results.sum(:value)/results.count
			else
				0
			end
		end

		def get_field_avg(field)
			results = Result.where(ratee_cname: self.name)
			#whole
			if field == "all"
				if results.count > 0
					results.sum(:value)/results.count
				else
					0
				end
			#part
			else
				sum = 0
				cnt = 0

				results.each do |result|
					if result.material.field == field
						sum += result.value
						cnt += 1
					end
				end

				if cnt > 0
					sum/cnt
				else
					0
				end
			end
		end

end
