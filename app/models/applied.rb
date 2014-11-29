class Applied < ActiveRecord::Base
  belongs_to :RateeGroup
  belongs_to :Developer
end
