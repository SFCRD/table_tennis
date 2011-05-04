class ChallengesController < InheritedResources::Base
  actions :all
  
  belongs_to :league
  
  before_filter :authenticate_player!
  
  def create
    @challenge = Challenge.new( params[ :challenge ].merge( :player => current_player ) )
    create!
  end
end
