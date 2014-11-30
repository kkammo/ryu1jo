class Result < ActiveRecord::Base
  belongs_to :developer, foreign_key: :ratee_id
  belongs_to :developer, foreign_key: :rater_id
  belongs_to :evaluation
  belongs_to :material

  validates_presence_of :developer, :evaluation, :material

  validates :value, inclusion: { in: 0..10 }

end
