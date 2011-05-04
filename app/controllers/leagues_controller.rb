class LeaguesController < InheritedResources::Base
  actions :all
  
  before_filter :authenticate_player!, :except => [ :index, :show ]
end
