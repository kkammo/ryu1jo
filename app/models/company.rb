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

end
