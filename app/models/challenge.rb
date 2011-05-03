class Challenge < ActiveRecord::Base
  belongs_to :challenger, :class_name => 'Player'
  belongs_to :opponent, :class_name => 'Player'
end
