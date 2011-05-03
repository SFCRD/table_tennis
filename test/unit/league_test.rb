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
end
