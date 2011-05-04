class CreateChallenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |t|
      t.integer :player_id
      t.integer :ranking_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :challenges
  end
end
