require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should assign players in index" do
    get :index
    assert_not_nil assigns( :players )
  end
  
  test "should get show" do
    player = Fabricate( :player )
    get :show, :id => player.id
    assert_response :success
  end
  test "should assign player in show" do
    player = Fabricate( :player )
    get :show, :id => player.id
    assert_not_nil assigns( :player )
  end
  test "should assign correct player in show" do
    player = Fabricate( :player )
    get :show, :id => player.id
    assert_equal player, assigns( :player )
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
  
  test "should not get edit if signed out" do
    player = Fabricate( :player )
    get :edit, :id => player.id
    assert_response 302
  end
  test "should get edit if signed in" do
    player = Fabricate( :player )
    sign_in player
    player = Fabricate( :player )
    get :edit, :id => player.id
    assert_response :success
  end
  test "should assign player in edit" do
    player = Fabricate( :player )
    sign_in player
    player = Fabricate( :player )
    get :edit, :id => player.id
    assert_not_nil assigns( :player )
  end
  test "should assign correct player in edit" do
    player = Fabricate( :player )
    sign_in player
    player = Fabricate( :player )
    get :edit, :id => player.id
    assert_equal player, assigns( :player )
  end
  
end
