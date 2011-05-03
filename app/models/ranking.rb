class Ranking < ActiveRecord::Base
  belongs_to :player
  belongs_to :league
  
  acts_as_list :scope => :league
end
