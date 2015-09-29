require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_invalid_without_name
    user = User.new
    assert !user.valid?, "Name is not being validated"
  end
end
