require 'test_helper'

class RankingsControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should assign rankings in index" do
    get :index
    assert_not_nil assigns( :rankings )
  end
  
  test "should get show" do
    ranking = Fabricate( :ranking )
    get :show, :id => ranking.id
    assert_response :success
  end
  test "should assign ranking in show" do
    ranking = Fabricate( :ranking )
    get :show, :id => ranking.id
    assert_not_nil assigns( :ranking )
  end
  test "should assign correct ranking in show" do
    ranking = Fabricate( :ranking )
    get :show, :id => ranking.id
    assert_equal ranking, assigns( :ranking )
  end
  
  test "should not post create if signed out" do
    post :create, :ranking => { :player => Fabricate( :player ), :league => Fabricate( :league ) }
    assert_response 302
    assert_redirected_to new_player_session_path
  end
  test "should post create if signed in" do
    player = Fabricate( :player )
    sign_in player
    assert_difference( 'Ranking.count' ) do
      post :create, :ranking => { :player => player, :league => Fabricate( :league ) }
    end
  end
  
end
