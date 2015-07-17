class Project < ActiveRecord::Base
  # Associations
  has_many :notes, dependent: :destroy

  # Validations
  validates :name,  presence: true,
                    uniqueness: true,
                    length: { maximum: 60 }

  # Scopes

  # Callbacks

  # Misc


end
