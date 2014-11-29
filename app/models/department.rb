require 'rubygems'
require 'composite_primary_keys'

class Department < ActiveRecord::Base
	self.primary_keys = [:dname, :cname]
	belongs_to :company, foreign_key: :cname, primary_key: :name
	has_many :developers, foreign_key: [:dname, :cname], primary_key: [:dname, :cname]

	# validate :Company_name_exists

	# def Company_name_exists
 #  	begin
 #    	Company.find(self.cname)
 #  	rescue ActiveRecord::RecordNotFound
 #    	errors.add(:Company_name, "cname foreign key must exist")
 #    	false
 #  	end
	# end

end