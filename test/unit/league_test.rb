require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  
  test "should not save league without a name" do
    league = League.new
    assert_equal false, league.save
  end
  test "should validate the presence of a name" do
    league = League.new
    league.save
    assert_error_on :name, league
  end
  
  test "should respond to member?" do
    assert_respond_to League.new, :member?
  end
  test "an unrelated player should not be a member of a league" do
    player = Fabricate( :player )
    league = Fabricate( :league )
    assert_equal false, league.member?( player )
  end
  test "a player should be a member of a league if they have a ranking in it" do
    player = Fabricate( :player )
    league = Fabricate( :league )
    Ranking.create!( :player => player, :league => league )
    assert_equal true, league.member?( player )
  end
end
