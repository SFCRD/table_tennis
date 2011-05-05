require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  test "should not save user without a name" do
    player = Player.new
    assert_equal false, player.save
  end
  test "should validate the presence of a name" do
    player = Player.new
    player.save
    assert_error_on :name, player
  end
  
  test "should respond to in?" do
    assert_respond_to Player.new, :in?
  end
  test "in? should return false if the player is not ranked in the given league" do
    player = Fabricate( :player )
    assert_equal false, player.in?( Fabricate( :league ) )
  end
  test "in? should return true if the player is ranked in the given league" do
    player = Fabricate( :player )
    league = Fabricate( :league )
    Fabricate( :ranking, :player => player, :league => league )
    assert_equal true, player.in?( league )
  end
  
  test "should respond to ranking" do
    assert_respond_to Player.new, :ranking
  end
  test "ranking should return false if the player does not have a ranking in the given league" do
    player = Fabricate( :player )
    league = Fabricate( :league )
    assert_equal false, player.ranking( league )
  end
  test "ranking should return a ranking instance if the player has a ranking in the given league" do
    player = Fabricate( :player )
    league = Fabricate( :league )
    Fabricate( :ranking, :player => player, :league => league )
    assert_instance_of Ranking, player.ranking( league )
  end
  test "ranking should return the ranking of the player in the given league" do
    player = Fabricate( :player )
    league = Fabricate( :league )
    ranking = Fabricate( :ranking, :player => player, :league => league )
    assert_equal ranking, player.ranking( league )
  end
  
  test "should respond to position" do
    assert_respond_to Player.new, :position
  end
  test "position should return false if the player does not have a ranking in the given league" do
    player = Fabricate( :player )
    league = Fabricate( :league )
    assert_equal false, player.position( league )
  end
  test "position should return the players position in the league if they have a ranking" do
    player = Fabricate( :player )
    league = Fabricate( :league )
    # because rankings act as a list, we need to create several mock rankings before the player's ranking
    Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :player => player, :league => league )
    assert_equal 5, player.position( league )
  end
end
