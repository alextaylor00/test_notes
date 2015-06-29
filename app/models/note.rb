# Stores notes. Notes are parents of comments.
class Note < ActiveRecord::Base
  validates :title, presence: true
  validates :text, presence: true

  default_scope { order(created_at: :desc) }
end
