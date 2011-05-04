class Challenge < ActiveRecord::Base
  belongs_to :player
  belongs_to :ranking
end
