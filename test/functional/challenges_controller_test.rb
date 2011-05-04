require 'test_helper'

class ChallengesControllerTest < ActionController::TestCase
  
  test "should not get index if signed out" do
    get :index
    assert_response 302
  end
  test "should get index if signed in" do
    player = Fabricate( :player )
    sign_in player
    get :index
    assert_response :success
  end
  
  test "should not get new if signed out" do
    get :new
    assert_response 302
  end
  test "should get new if signed in" do
    player = Fabricate( :player )
    sign_in player
    get :new
    assert_response :success
  end
end
