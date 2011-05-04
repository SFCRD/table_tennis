require 'test_helper'

class ChallengesControllerTest < ActionController::TestCase
  
  test "should not get index if signed out" do
    league = Fabricate( :league )
    get :index, :league_id => league.id
    assert_response 302
  end
  test "should get index if signed in" do
    player = Fabricate( :player )
    sign_in player
    league = Fabricate( :league )
    get :index, :league_id => league.id
    assert_response :success
  end
  test "should assign challenges in index" do
    player = Fabricate( :player )
    sign_in player
    league = Fabricate( :league )
    get :index, :league_id => league.id
    assert_not_nil assigns( :challenges )
  end
  test "should assign league in index" do
    player = Fabricate( :player )
    sign_in player
    league = Fabricate( :league )
    get :index, :league_id => league.id
    assert_not_nil assigns( :league )
  end
  test "should assign correct league in index" do
    player = Fabricate( :player )
    sign_in player
    league = Fabricate( :league )
    get :index, :league_id => league.id
    assert_equal league, assigns( :league )
  end
  
  test "should not get new if signed out" do
    league = Fabricate( :league )
    get :new, :league_id => league.id
    assert_response 302
  end
  test "should get new if signed in" do
    player = Fabricate( :player )
    sign_in player
    league = Fabricate( :league )
    get :new, :league_id => league.id
    assert_response :success
  end
  test "should assign league in new" do
    player = Fabricate( :player )
    sign_in player
    league = Fabricate( :league )
    get :new, :league_id => league.id
    assert_not_nil assigns( :league )
  end
  test "should assign correct league in new" do
    player = Fabricate( :player )
    sign_in player
    league = Fabricate( :league )
    get :new, :league_id => league.id
    assert_equal league, assigns( :league )
  end
  
  test "should not get show if signed out" do
    challenge = Fabricate( :challenge )
    get :show, :league_id => challenge.ranking.league.id, :id => challenge.id
    assert_response 302
  end
  test "should get show if signed in" do
    player = Fabricate( :player )
    sign_in player
    challenge = Fabricate( :challenge )
    get :show, :league_id => challenge.ranking.league.id, :id => challenge.id
    assert_response :success
  end
  test "should assign challenge in show" do
    player = Fabricate( :player )
    sign_in player
    challenge = Fabricate( :challenge )
    get :show, :league_id => challenge.ranking.league.id, :id => challenge.id
    assert_not_nil assigns( :challenge )
  end
  test "should assign correct challenge in show" do
    player = Fabricate( :player )
    sign_in player
    challenge = Fabricate( :challenge )
    get :show, :league_id => challenge.ranking.league.id, :id => challenge.id
    assert_equal challenge, assigns( :challenge )
  end
  test "should assign league in show" do
    player = Fabricate( :player )
    sign_in player
    challenge = Fabricate( :challenge )
    get :show, :league_id => challenge.ranking.league.id, :id => challenge.id
    assert_not_nil assigns( :league )
  end
  test "should assign correct league in show" do
    player = Fabricate( :player )
    sign_in player
    challenge = Fabricate( :challenge )
    get :show, :league_id => challenge.ranking.league.id, :id => challenge.id
    assert_equal challenge.ranking.league, assigns( :league )
  end
  
  test "should not post create if signed out" do
    ranking = Fabricate( :ranking )
    post :create, :league_id => ranking.league.id, :challenge => { :ranking => ranking }
    assert_response 302
    assert_redirected_to new_player_session_path
  end
  test "should post create if signed in" do
    player = Fabricate( :player )
    sign_in player
    ranking = Fabricate( :ranking )
    assert_difference( 'Challenge.count' ) do
      post :create, :league_id => ranking.league.id, :challenge => { :ranking => ranking }
    end
  end
  test "should redirect to league challenges path after post create" do
    player = Fabricate( :player )
    sign_in player
    ranking = Fabricate( :ranking )
    post :create, :league_id => ranking.league.id, :challenge => { :ranking => ranking }
    assert_redirected_to league_challenges_path( ranking.league )
  end
  test "should create a challenge referencing the selected ranking" do
    player = Fabricate( :player )
    sign_in player
    ranking = Fabricate( :ranking )
    post :create, :league_id => ranking.league.id, :challenge => { :ranking => ranking }
    assert_equal ranking, Challenge.last.ranking
  end
  test "should create a challenge referencing the current_player" do
    player = Fabricate( :player )
    sign_in player
    ranking = Fabricate( :ranking )
    post :create, :league_id => ranking.league.id, :challenge => { :ranking => ranking }
    assert_equal player, Challenge.last.player
  end
  
  test "should not post destroy if signed out" do
    challenge = Fabricate( :challenge )
    post :destroy, :league_id => challenge.ranking.league.id, :id => challenge.id
    assert_response 302
    assert_redirected_to new_player_session_path
  end
  test "should post destroy if signed in" do
    player = Fabricate( :player )
    sign_in player
    challenge = Fabricate( :challenge )
    assert_difference( 'Challenge.count', -1 ) do
      post :destroy, :league_id => challenge.ranking.league.id, :id => challenge.id
    end
  end
  test "should redirect to league challenges path after post destroy" do
    player = Fabricate( :player )
    sign_in player
    challenge = Fabricate( :challenge )
    post :destroy, :league_id => challenge.ranking.league.id, :id => challenge.id
    assert_redirected_to league_challenges_path( challenge.ranking.league )
  end

end
