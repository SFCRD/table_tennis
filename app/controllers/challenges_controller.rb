class ChallengesController < InheritedResources::Base
  actions :all
  
  before_filter :authenticate_player!
end
