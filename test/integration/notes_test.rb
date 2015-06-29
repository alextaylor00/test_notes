require 'test_helper'

class NotesTest < ActionDispatch::IntegrationTest

  test "invalid note" do
    get new_note_path
    assert_template 'notes/new'
    assert_no_difference 'Note.count' do
      post notes_path, note: {  title: "",
                                text: "" }
    end

    assert_template 'notes/new'
  end

end
