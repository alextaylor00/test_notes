require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  def setup
    @note = notes(:one)
  end

  test "project, title and text should be present" do
    assert @note.valid?

    @note.title = ""
    @note.text = ""
    @note.project = nil
    assert_not @note.valid?
  end



end
