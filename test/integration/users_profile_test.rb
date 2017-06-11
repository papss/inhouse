require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test 'profile display' do
    get user_path(@user)
    assert_template 'users/show'
  end

end
