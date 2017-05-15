require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { user_name: "",
                                         email_address: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
      end
      assert_template 'users/new'
      # add tests to assert notice div message/css
    end
  end

end
