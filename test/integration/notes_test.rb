require 'test_helper'

class NotesTest < ActionDispatch::IntegrationTest

  def setup
    @test_note = notes(:one)
  end

  test "shouldn't create an invalid note" do
    project = projects(:one)
    get new_project_note_path(project)
    assert_template 'notes/new'
    assert_no_difference 'Note.count' do
      post project_notes_path(project), note: {  project_id: project,
                                                 title: "",
                                                 text: "" }
    end

    assert_template 'notes/new'
  end

  test "should create a valid note" do
    project = projects(:one)
    get new_project_note_path(project)
    assert_template 'notes/new'
    assert_difference 'Note.count', 1 do
      post project_notes_path(project), note: {  project_id: project,
                                                 title: "Test Note",
                                                 text: "Example text" }
    end

    follow_redirect!
    assert_template "notes/show"
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

  test "BUGFIX: new comment object is displayed below existing comments" do
    note_with_one_comment = notes(:note_with_one_comment)
    get note_path(note_with_one_comment)
    assert_select "#comment", 1
  end

end
