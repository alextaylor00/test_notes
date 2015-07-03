require 'test_helper'

class NotesTest < ActionDispatch::IntegrationTest

  def setup
    @test_note = notes(:one)
  end

  test "invalid note" do
    get new_note_path
    assert_template 'notes/new'
    assert_no_difference 'Note.count' do
      post notes_path, note: {  title: "",
                                text: "" }
    end

    assert_template 'notes/new'
  end

  test "submitting a comment with text works" do
      get note_path(@test_note)
      assert_template 'notes/show'
      assert_difference 'Comment.count', 1 do
        post note_comments_path(@test_note), comment: { text: "hey i'm text" }
      end

  end

  test "can't submit a blank comment" do
    get note_path(@test_note)
    assert_template 'notes/show'
    assert_no_difference 'Comment.count' do
      post note_comments_path(@test_note), comment: { text: "" }
    end
  end

end
