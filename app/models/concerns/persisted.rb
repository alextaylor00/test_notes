module Persisted
  extend ActiveSupport::Concern

  # used primarily to return a collection of comments to display
  # on the notes/show page that does NOT contain the new
  # nil @comment object

  def persisted
    select(&:persisted?)
  end

end
