class RaterGroup < ActiveRecord::Base
	has_many :seleceteds
	has_many :mappings
end
