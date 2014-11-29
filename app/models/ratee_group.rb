class RateeGroup < ActiveRecord::Base
	belongs_to :evaluation
	has_many :applieds
	has_many :mappings
end
