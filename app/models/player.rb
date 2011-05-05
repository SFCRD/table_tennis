class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  validates_presence_of :name
  
  has_many :rankings
  
  has_many :challenges
  
  def in?( league )
    rankings.map( &:league ).include? league
  end

  def ranking( league )
    in?( league ) ? rankings.select { |r| r.league.eql? league }.first : false
  end
  
  def position( league )
    in?( league ) ? ranking( league ).position : false
  end

end
