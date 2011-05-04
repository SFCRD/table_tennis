class LeaguesController < InheritedResources::Base
  actions :index, :show
  
  # before_filter :authenticate_player!, :except => [ :index, :show ]
end
