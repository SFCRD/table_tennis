class League < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :rankings, :order => 'position'
  
  has_many :challenges, :through => :rankings
end
