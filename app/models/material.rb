class Material < ActiveRecord::Base
  belongs_to :developer
  has_one :result

  validates_presence_of :developer

  enum field: {web: 0, ios: 1, android: 2, windows: 3, embeded: 4}
  validates :prate, inclusion: { in: 0..1 }
end
