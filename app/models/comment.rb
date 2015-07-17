class Comment < ActiveRecord::Base
  # Associations
  belongs_to :note

  # Validations
  validates :text, presence: true

  # Scopes
  default_scope { order(created_at: :asc) }

  # Callbacks

  # Misc
end
