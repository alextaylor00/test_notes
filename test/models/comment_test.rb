require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @note = notes(:one)
    @comment = comments(:one)
  end

  test "text should be present" do
    @comment.text = ""
    assert_not @comment.valid?
  end

end
