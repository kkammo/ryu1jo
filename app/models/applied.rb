class Applied < ActiveRecord::Base
	belongs_to :evaluation
  belongs_to :ratee_group
  belongs_to :developer
end
