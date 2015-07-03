require 'test_helper'

class ScaffoldTestsControllerTest < ActionController::TestCase
  setup do
    @scaffold_test = scaffold_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scaffold_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scaffold_test" do
    assert_difference('ScaffoldTest.count') do
      post :create, scaffold_test: { score: @scaffold_test.score, text: @scaffold_test.text }
    end

    assert_redirected_to scaffold_test_path(assigns(:scaffold_test))
  end

  test "should show scaffold_test" do
    get :show, id: @scaffold_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scaffold_test
    assert_response :success
  end

  test "should update scaffold_test" do
    patch :update, id: @scaffold_test, scaffold_test: { score: @scaffold_test.score, text: @scaffold_test.text }
    assert_redirected_to scaffold_test_path(assigns(:scaffold_test))
  end

  test "should destroy scaffold_test" do
    assert_difference('ScaffoldTest.count', -1) do
      delete :destroy, id: @scaffold_test
    end

    assert_redirected_to scaffold_tests_path
  end
end
