require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  def setup
    @note = Note.new(title: "test", text: "test")

  end

  test "title and text should be present" do
    @note.title = ""
    @note.text = ""
    assert_not @note.valid?
  end

end
