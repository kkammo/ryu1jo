class RaterGroup < ActiveRecord::Base
	belongs_to :evaluation
	has_many :seleceteds
	has_many :mappings
end
