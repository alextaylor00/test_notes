# Stores notes. Notes are parents of comments.
class Note < ActiveRecord::Base
  # Associations
  belongs_to :project
  has_many :comments, dependent: :destroy do
    include Persisted
  end

  # Validations
  validates :project, presence: true
  validates :title, presence: true
  validates :text, presence: true

  # Scopes
  default_scope { order(created_at: :desc) }

  # Callbacks


  # Misc
  acts_as_taggable

  def add_tags(string)
    delim = ActsAsTaggableOn.delimiter
    self.tag_list.add(string, parse: true)
    return string.split(delim)
  end


end
