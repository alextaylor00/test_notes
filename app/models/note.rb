# Stores notes. Notes are parents of comments.
class Note < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy do
    def persisted
      # used to return a collection of comments to display
      # on the notes/show page that does NOT contain the new
      # nil @comment object
      select(&:persisted?)
    end
  end

  validates :project, presence: true
  validates :title, presence: true
  validates :text, presence: true

  default_scope { order(created_at: :desc) }


end
