# Stores notes. Notes are parents of comments.
class Note < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :project, presence: true
  validates :title, presence: true
  validates :text, presence: true

  default_scope { order(created_at: :desc) }


end
