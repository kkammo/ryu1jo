class Selected < ActiveRecord::Base
  belongs_to :RaterGroup
  belongs_to :Developer
end
