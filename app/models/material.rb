class Material < ActiveRecord::Base
  belongs_to :developer
  has_one :result

  validates_presence_of :developer
end
