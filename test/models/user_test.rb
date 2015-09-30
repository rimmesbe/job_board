require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @u = users(:bob)
  end

  test "invalid without a name" do
    user = User.new
    assert !user.valid?, "Name is not being validated"
  end

  test "invalid name gives error message" do
    @u.name = nil
    assert_presence(@u, :name)
  end

  test "invalid email gives error message" do
    @u.email = nil
    assert_presence(@u, :email)
  end

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
