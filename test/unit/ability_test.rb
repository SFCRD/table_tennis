require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  
  setup do
    @player = Fabricate( :player )
    @ability = Ability.new( @player )
  end
  
  test "a player cannot challenge a ranking if they do not have a ranking in the same league" do
    assert @ability.cannot?( :challenge, Fabricate( :ranking ) )
  end
  test "a player cannot challenge their own rankings" do
    ranking = Fabricate( :ranking, :player => @player )
    assert @ability.cannot?( :challenge, ranking )
  end
  test "a player can challenge a ranking 1 position ahead of theirs" do
    league = Fabricate( :league )
    ranking = Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league, :player => @player )
    assert @ability.can?( :challenge, ranking )
  end
  test "a player can challenge a ranking 2 positions ahead of theirs" do
    league = Fabricate( :league )
    ranking = Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league, :player => @player )
    Fabricate( :ranking, :league => league )
    assert @ability.can?( :challenge, ranking )
  end
  test "a player cannot challenge a ranking 3 positions ahead of theirs" do
    league = Fabricate( :league )
    ranking = Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league, :player => @player )
    Fabricate( :ranking, :league => league )
    assert @ability.cannot?( :challenge, ranking )
  end
  test "a player cannot challenge a ranking below theirs" do
    league = Fabricate( :league )
    Fabricate( :ranking, :league => league, :player => @player )
    ranking = Fabricate( :ranking, :league => league )
    assert @ability.cannot?( :challenge, ranking )
  end
  test "a player cannot challenge two ahead if they are the lowest ranked in the league" do
    league = Fabricate( :league )
    ranking = Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league )
    Fabricate( :ranking, :league => league, :player => @player )
    assert @ability.cannot?( :challenge, ranking )
  end
end
