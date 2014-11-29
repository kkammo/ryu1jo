class RateeGroup < ActiveRecord::Base
	has_many :applieds
	has_many :mappings
end
