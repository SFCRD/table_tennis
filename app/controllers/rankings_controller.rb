class RankingsController < InheritedResources::Base
  
  before_filter :authenticate_player!, :only => [ :create ]
end
