# Stores notes. Notes are parents of comments.
class Note < ActiveRecord::Base
  attr_accessor :text_file

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true

  default_scope { order(created_at: :desc) }

  before_validation :convert_file_to_note_text

  private
    def convert_file_to_note_text
      unless self.text_file.nil?
        self.text = self.text_file.read 500
      end
    end

end
