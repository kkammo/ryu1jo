class Selected < ActiveRecord::Base
	belongs_to :evaluation
  belongs_to :rater_group
  belongs_to :developer

	validates_presence_of :evaluation, :rater_group, :developer
end
