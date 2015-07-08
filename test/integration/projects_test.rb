require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest
  test "project index should display all projects" do
    get projects_path
    assert_template 'projects/index'
    assert_select "li", projects(:one).name
    assert_select "li", projects(:two).name
    assert_select "li", projects(:three).name
  end

  test "project index should contain link to new project" do
    get projects_path
    assert_select 'a[href=?]', new_project_path
  end

  test "shouldn't be able to create a new project with no name" do
    get new_project_path
    assert_template "projects/new"
    assert_no_difference 'Project.count' do
      post projects_path, project: { name: "" }
    end
    assert_template "projects/new"
  end

  test "should be able to create a project with a valid name" do
    get new_project_path
    assert_difference 'Project.count', 1 do
      post projects_path, project: { name: "My New Project Name" }
    end

    project = assigns(:project)
    assert_redirected_to project_path(project)
  end

  test "should be able to access new note page from project show" do
    project = projects(:one)
    get project_path(project)
    assert_template "projects/show"
    assert_select "a[href=?]", new_project_note_path(project)
  end

  test "projects show page should display all notes" do
    project = projects(:one)
    get project_path(project)
    project.notes.each do |note|
      assert_match note.title, response.body
    end
  end


end
