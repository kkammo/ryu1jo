class Company < ActiveRecord::Base
	self.primary_key = :name
	has_many :departments, foreign_key: :cname, primary_key: :name
	has_many :developers, foreign_key: :cname, primary_key: :name

	public
		def get_avg(evaluation_id)
			evaluation = Evaluation.find(evaluation_id)
			employees = self.developers

			results = []
			for i in 0..employees.count-1
				results += Result.where(evaluation_id: evaluation_id, ratee_id: employees[i].id)
			end

			if results.count > 0
				results.sum(&:value)/results.count
			else
				0
			end
		end

end
