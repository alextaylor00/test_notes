class Comment < ActiveRecord::Base
  belongs_to :note

  validates :text, presence: true

  default_scope { order(created_at: :asc) }
end
