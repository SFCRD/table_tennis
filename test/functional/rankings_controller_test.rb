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
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
end
