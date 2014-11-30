class Career < ActiveRecord::Base
  belongs_to :developer
  validates_presence_of :developer
end
