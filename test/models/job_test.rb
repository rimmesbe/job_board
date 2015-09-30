require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "valid with all attributes" do
    j = jobs(:carpenter)
    assert j.valid?, "Job is not valid"
  end

  test "invalid with no title" do
    j = Job.new
    assert !j.valid?, "Title not being validated"
  end

end
