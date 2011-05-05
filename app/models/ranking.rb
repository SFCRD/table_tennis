class Ranking < ActiveRecord::Base
  belongs_to :player
  belongs_to :league
  
  has_many :challenges
  
  acts_as_list :scope => :league
  
  def challenged?
    challenges.any?
  end
  
  def reach
    last? ? [ 1 ] : [ 1, 2 ]
  end
end
