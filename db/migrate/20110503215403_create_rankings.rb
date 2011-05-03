class CreateRankings < ActiveRecord::Migration
  def self.up
    create_table :rankings do |t|
      t.integer :player_id
      t.integer :league_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rankings
  end
end
