require 'test_helper'

class TagsTest < ActionDispatch::IntegrationTest

  def setup
    @test_note = notes(:one)

    @tag_one = "tag_one"
    @tag_two = "tag_two"
    @tag_three = "tag_three"

    @test_note.tag_list.add(@tag_one)
    @test_note.tag_list.add(@tag_two)
    @test_note.tag_list.add(@tag_three)

    @test_note.save
    @test_note.reload
  end

  test "should display all of a note's tags on the notes show page" do
    get note_path(@test_note)
    assert_match @tag_one, response.body
    assert_match @tag_two, response.body
    assert_match @tag_three, response.body
  end

  test "should be able to add tags from the notes show page" do
    get note_path(@test_note)
    assert_select 
  end

  test "should be able to remove tags from the notes show page" do
    flunk
  end

  test "shouldn't wipe out 'new comment' text box when adding a new tag" do
    # TODO: maybe we can inject a value into the new comment box, then
    #   test for it after adding a new tag
    flunk
  end



end
