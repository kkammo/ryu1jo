class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company, foreign_key: :cname, primary_key: :name
  belongs_to :department, foreign_key: [:dname, :cname], primary_key: [:dname, :cname]

  has_many :applieds
  has_many :selecteds
  has_many :results, foreign_key: :ratee_id
  has_many :results, foreign_key: :rater_id
  has_many :materials
  has_many :careers

  validates_presence_of :company

end
