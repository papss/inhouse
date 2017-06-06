require "application_system_test_case"

class LeaguesTest < ApplicationSystemTestCase

  def setup
    @user = users(:one)
    @league = @user.leagues.build(name: "TestLeague")
  end

  test "should be valid" do
    assert @league.valid?
  end

  test "user id should be present" do
    @league.user_id = nil
    assert_not @league.valid?
  end

  test "order should be most recent first" do
    assert_equal leagues(:most_recent), League.first
  end

end
