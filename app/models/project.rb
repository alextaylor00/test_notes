class Project < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 60 }

end
