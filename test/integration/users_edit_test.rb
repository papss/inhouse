require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { user_name: "",
                                              email_address: "foo@invalid",
                                              password: "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    user_name = "Foo Bar"
    email_address = "foo@bar.com"
    patch user_path(@user), params: { user: { user_name: user_name,
                                              email_address: email_address,
                                              password: "",
                                              password_confirmation: ""} }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal user_name, @user.user_name
    assert_equal email_address, @user.email_address
  end

end
