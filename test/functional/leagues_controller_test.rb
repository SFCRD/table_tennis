require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should assign leagues in index" do
    get :index
    assert_not_nil assigns( :leagues )
  end
  
  test "should get show" do
    league = Fabricate( :league )
    get :show, :id => league.id
    assert_response :success
  end
  test "should assign league in show" do
    league = Fabricate( :league )
    get :show, :id => league.id
    assert_not_nil assigns( :league )
  end
  test "should assign correct league in show" do
    league = Fabricate( :league )
    get :show, :id => league.id
    assert_equal league, assigns( :league )
  end
  
  # test "should not get new if signed out" do
  #     get :new
  #     assert_response 302
  #   end
  #   test "should get new if signed in" do
  #     player = Fabricate( :player )
  #     sign_in player
  #     get :new
  #     assert_response :success
  #   end
  #   
  #   test "should not get edit if signed out" do
  #     league = Fabricate( :league )
  #     get :edit, :id => league.id
  #     assert_response 302
  #   end
  #   test "should get edit if signed in" do
  #     player = Fabricate( :player )
  #     sign_in player
  #     league = Fabricate( :league )
  #     get :edit, :id => league.id
  #     assert_response :success
  #   end
  #   test "should assign league in edit" do
  #     player = Fabricate( :player )
  #     sign_in player
  #     league = Fabricate( :league )
  #     get :edit, :id => league.id
  #     assert_not_nil assigns( :league )
  #   end
  #   test "should assign correct league in edit" do
  #     player = Fabricate( :player )
  #     sign_in player
  #     league = Fabricate( :league )
  #     get :edit, :id => league.id
  #     assert_equal league, assigns( :league )
  #   end

end
