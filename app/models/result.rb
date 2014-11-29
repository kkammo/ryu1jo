class Result < ActiveRecord::Base
  belongs_to :ratee_group, foreign_key: :ratee_id
  belongs_to :rater_Group, foreign_key: :rater_id
  belongs_to :evaluation
  belongs_to :material
end
