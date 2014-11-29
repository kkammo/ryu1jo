require 'rubygems'
require 'composite_primary_keys'

class Mapping < ActiveRecord::Base
	self.primary_keys = [:RateeGroup_id, :RaterGroup_id]

  belongs_to :RateeGroup
  belongs_to :RaterGroup
  belongs_to :Evaluation
end
