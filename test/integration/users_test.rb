require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  def setup
    @j = jobs(:carpenter)
    @u = users(:bob)
  end

  test "should be able to sign up" do
    sign_up_as("Jack", "jack@jack.com")
    assert User.find_by(name: "Jack")
    assert_equal root_path, current_path
  end

  test "should be able to create new job when signed in" do
    sign_up_as("Jack", "jack@jack.com")
    click_link "Add Job"
    fill_in "job_title", with: "Banker"
    fill_in "job_description", with: "Protects money"
    click_button "Create Job"
    assert Job.find_by(title: "Banker")
    assert_equal jobs_path, current_path
  end

  test "should not be able to create new job when signed out" do
    visit root_url
    click_link "Add Job"
    assert_equal user_session_path, current_path
  end

  test "should not be able to edit job when signed out" do
    visit root_url
    click_link @j.title
    click_link "Edit Posting"
    assert_equal user_session_path, current_path
  end

  test "should not be able to edit other users jobs" do
    sign_up_as("Jack", "jack@jack.com")
    click_link @j.title
    click_link "Edit Posting"
    assert_equal job_path(@j), current_path
    within("p.alert") do
      assert has_content?("You don't own this post")
    end
  end
end
