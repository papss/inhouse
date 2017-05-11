require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(user_name: "TestUser", email_address: "test@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.user_name = "     "
    assert_not @user.valid?
  end

end
