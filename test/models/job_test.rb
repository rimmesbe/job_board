require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    @j = jobs(:carpenter)
  end

  should validate_presence_of(:title)
  should validate_presence_of(:description)
  should belong_to(:user)

  test "valid with all attributes" do
    assert @j.valid?, "Job is not valid"
  end

  test "should respond to user" do
    assert_respond_to @j, :user
  end

  test "should only have 1 user" do
    assert_equal users(:bob), @j.user
  end

end

# Old tests replaced with 'Shoulda' gem tests
#.............................................
# test "invalid title gives error message" do
  #   @j.title = nil
  #   assert_presence(@j, :title)
  # end

  # test "invalid description gives error message" do
  #   @j.description = nil
  #   assert_presence(@j, :description)
  # end
