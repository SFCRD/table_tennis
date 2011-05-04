# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

League.create( :name => 'AKQA Table Tennis' ).tap do |league|
  
  [ 'James De Jesus', 'Vinit Patil', 'Thomas Ko', 'Miles Lukas' ].each do |name|
    
    puts "Trying to create player #{name}"
    
    Player.create( :name => name, :email => Faker::Internet.email, :password => Devise.friendly_token[0,20] ).tap do |player|
      
      Ranking.create( :player => player, :league => league )
      
    end
    
  end
  
end

Player.create( :name => "Jeremy Ruppel", :email => 'me@me.com', :password => "idontplay" )