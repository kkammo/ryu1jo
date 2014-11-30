class RaterGroup < ActiveRecord::Base
	belongs_to :evaluation
	has_many :selecteds
	has_many :mappings
end
