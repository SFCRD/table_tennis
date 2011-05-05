require 'test_helper'

class RankingTest < ActiveSupport::TestCase
  
  test "should respond to challenged?" do
    assert_respond_to Ranking.new, :challenged?
  end
  test "challenged? should return false if there is no challenge referencing the ranking" do
    ranking = Fabricate( :ranking )
    assert_equal false, ranking.challenged?
  end
  test "challenged? should return true if there is a challenge referencing the ranking" do
    ranking = Fabricate( :ranking )
    challenge = Fabricate( :challenge, :ranking => ranking )
    assert_equal true, ranking.challenged?
  end
  
  test "should respond to reach" do
    assert_respond_to Ranking.new, :reach
  end
  test "reach should return an array" do
    ranking = Fabricate( :ranking )
    assert_instance_of Array, ranking.reach
  end
  test "reach should include 1 if the ranking is the last in the list" do
    ranking = Fabricate( :ranking )
    assert_equal [ 1 ], ranking.reach
  end
  test "reach should include 1 and 2 if the ranking is not the last in the list" do
    league = Fabricate( :league )
    ranking = Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league )
    assert_equal [ 1, 2 ], ranking.reach
  end
end
