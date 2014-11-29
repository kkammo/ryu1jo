class Result < ActiveRecord::Base
  belongs_to :RaterGroup
  belongs_to :RateeGroup
  belongs_to :Evaluation
  belongs_to :Material
end
