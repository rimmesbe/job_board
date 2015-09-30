require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @u = users(:bob)
  end
  # 'shoulda' gem tests:
  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:name)
  should validate_uniqueness_of(:email)
  should have_many(:jobs)
  should_not allow_value("blah").for(:email)
  should allow_value("a@b.com").for(:email)

  test "valid with all attributes" do
    assert @u.valid?, "User is not valid"
  end

  test "should respond to jobs" do
    assert_respond_to @u, :jobs
  end

  test "is_owner? returns true if user owns job" do
    assert_equal true, @u.is_owner?(jobs(:carpenter))
  end

  test "is_owner? returns false if user doesn't own job" do
    assert_equal false, @u.is_owner?(jobs(:doctor))
  end

  test "should contain only jobs that belong to user" do
    assert @u.jobs.all? {|j| j.user == @u }
  end
end

  #Some verbose raw test methods that were replaced by 'shoulda' gem
  #.............................................
  # test "invalid name gives error message" do
  #   @u.name = nil
  #   assert_presence(@u, :name)
  # end

  # test "invalid email gives error message" do
  #   @u.email = nil
  #   assert_presence(@u, :email)
  # end
