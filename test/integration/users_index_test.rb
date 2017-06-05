require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:one)
    @non_admin = users(:two)
  end

  test "index" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'Destroy', count: 0
  end

end
