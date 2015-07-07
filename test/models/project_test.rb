require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "project name should be unique" do
    project_one  =  Project.create(name: "test")
    project_dupe =  Project.create(name: "test")

    assert_not project_dupe.valid?
  end

  test "project name shouldn't be longer than 60 chars" do
    long_proj_name = "a" * 61
    proj = Project.create(name: long_proj_name)

    assert_not proj.valid?
  end

  test "project name shouldn't be blank" do
    proj = Project.create(name: "")
    assert_not proj.valid?
  end

end
