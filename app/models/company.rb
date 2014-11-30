class Company < ActiveRecord::Base
	self.primary_key = :name
	has_many :departments, foreign_key: :cname, primary_key: :name
	has_many :developers, foreign_key: :cname, primary_key: :name
end
