class Ranking < ActiveRecord::Base
  belongs_to :player
  belongs_to :league
  
  has_many :challenges
  
  acts_as_list :scope => :league
end
