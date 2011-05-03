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
end
