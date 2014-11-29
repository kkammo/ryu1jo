class Evaluation < ActiveRecord::Base
	has_many :mappings
	has_many :results
	has_many :ratee_groups
	has_many :rater_groups
	has_many :applieds
	has_many :selecteds
	
end
