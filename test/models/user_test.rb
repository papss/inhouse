require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(user_name: "UserTest", email_address: "user-test@gmail.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

# PRESENCE VALIDATIONS:
  test "name should be present" do
    @user.user_name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email_address = "     "
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

#LENGTH VALIDATIONS:
  test "name should not be too long" do
    @user.user_name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email_address = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

# EMAIL VALIDATIONS:
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email_address = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email_address = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should save as lower-case" do
    mixed_case_email                    = "Foo@exAMPLE.com"
    @user.email_address                 = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email_address
  end

  test "email addresses should be unique" do
    duplicate_user                      = @user.dup
    duplicate_user.email_address        = @user.email_address.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

#PASSWORD VALIDATIONS:

end
