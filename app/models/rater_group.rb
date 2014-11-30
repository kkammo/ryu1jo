class RaterGroup < ActiveRecord::Base
	belongs_to :evaluation
	has_many :selecteds
	has_many :mappings

	validates_presence_of :evaluation
end
