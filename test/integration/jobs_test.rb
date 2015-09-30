require 'test_helper'

class JobsTest < ActionDispatch::IntegrationTest

  test "anyone can view job information" do
    j = jobs(:carpenter)
    visit job_url(j)

    assert_equal job_path(j), current_path
    within("h1") do
      assert has_content?(j.title)
    end
  end
end
