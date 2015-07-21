require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  def setup
    @note = notes(:one)
  end

  test "should show a specific note" do
    get :show, id: @note
    assert_response :success
    assert_not_nil assigns(:note)
    assert_not_nil assigns(:comment)
  end

  test "should get edit note" do
    get :edit, id: @note
    assert_response :success
  end

  test "should update note" do
    patch :update, id: @note, note: { title: "Update title", text: "Update text" }
    assert_redirected_to note_path(assigns(:note))
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, id: @note
    end

    assert_redirected_to project_path(@note.project)
  end

  test "should add a tag to the note" do
    assert_difference('Note.find(@note.id).tag_list.count', 1) do
      post :add_tag, id: @note, tag_string: "tag_name"
    end
  end

  test "should add multiple tags to the note" do
    assert_difference('Note.find(@note.id).tag_list.count', 2) do
      post :add_tag, id: @note, tag_string: "tag1, tag2"
    end
  end

  test "shouldn't create empty tags" do
    assert_no_difference('Note.find(@note.id).tag_list.count') do
      post :add_tag, id: @note, tag_string: " "
      post :add_tag, id: @note, tag_string: "  "
      post :add_tag, id: @note, tag_string: ""
      post :add_tag, id: @note, tag_string: ","
    end
  end

  test "should remove a tag from the note" do
    post :add_tag, id: @note, tag_string: "tag_name"

    assert_difference('Note.find(@note.id).tag_list.count', -1) do
      delete :remove_tag, id: @note, tag_string: "tag_name"
    end
  end

  test "should remove multiple tags from the note" do
    post :add_tag, id: @note, tag_string: "tag1, tag2"

    assert_difference('Note.find(@note.id).tag_list.count', -2) do
      delete :remove_tag, id: @note, tag_string: "tag1, tag2"
    end
  end




end
