class CreateChallenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |t|
      t.integer :challenger_id
      t.integer :opponent_id
      t.integer :league_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :challenges
  end
end
