class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum field: {web: 0, ios: 1, android: 2, windows: 3, embeded: 4}

  belongs_to :company, foreign_key: :cname, primary_key: :name
  belongs_to :department, foreign_key: [:dname, :cname], primary_key: [:dname, :cname]

  has_many :applieds
  has_many :selecteds
  has_many :results, foreign_key: :ratee_id
  has_many :results, foreign_key: :rater_id
  has_many :materials
  has_many :careers

  validates_presence_of :company

  public
    def get_avg
      sum = 0
      cnt = 0
      for i in 0..self.materials.count-1
        sum += Result.where(material_id: self.materials[i].id).sum(:value)
        cnt += Result.where(material_id: self.materials[i].id).count
      end
      if cnt > 0
        sum/cnt
      else
        0
      end
    end

end
