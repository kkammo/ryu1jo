require 'rubygems'
require 'composite_primary_keys'

class Mapping < ActiveRecord::Base
	self.primary_keys = [:ratee_group_id, :rater_group_id]

  belongs_to :ratee_group
  belongs_to :rater_group
  belongs_to :evaluation
end
