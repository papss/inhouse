require 'test_helper'

class LeaguesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @league = leagues(:one)
  end


#auto generated tests

  test "should get index" do
    get leagues_url
    assert_response :success
  end

  test "should get new" do
    get new_league_url
    assert_response :success
  end

  test "should create league" do
    assert_difference('League.count') do
      post leagues_url, params: { league: { name: @league.name } }
    end

    assert_redirected_to league_url(League.last)
  end

  test "should show league" do
    get league_url(@league)
    assert_response :success
  end

  test "should get edit" do
    get edit_league_url(@league)
    assert_response :success
  end

  test "should update league" do
    patch league_url(@league), params: { league: { name: @league.name } }
    assert_redirected_to league_url(@league)
  end

  test "should destroy league" do
    assert_difference('League.count', -1) do
      delete league_url(@league)
    end

    assert_redirected_to leagues_url
  end

# written tests:

  test 'should redirect create when logged in' do
    assert_no_difference 'League.count' do
      post leagues_path, params: { league: { name: "TestName"} }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'League.count' do
      delete leagues_path(@league)
    end
    assert_redirected_to login_url
  end

end
