class RankingsController < InheritedResources::Base
  
  before_filter :authenticate_player!, :only => [ :create ]
  
  def create
    @ranking = Ranking.new( params[ :ranking ].merge( :player => current_player ) )
    create! { league_path @ranking.league }
  end
end
