class League < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :rankings, :order => 'position'
  
  has_many :challenges, :through => :rankings
  
  def member?( player )
    rankings.map( &:player ).include? player
  end
end
