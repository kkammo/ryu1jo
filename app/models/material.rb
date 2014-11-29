class Material < ActiveRecord::Base
  belongs_to :developer
  has_one :result
end
