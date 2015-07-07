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

  test "should create a new note" do
    assert_difference 'Note.count' do
      post :create, project_id: projects(:one),
                    note: { title: "Test title", text: "Test text" }
    end

    assert_redirected_to note_path(assigns(:note))
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


end
