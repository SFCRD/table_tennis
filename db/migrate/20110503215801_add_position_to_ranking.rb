class AddPositionToRanking < ActiveRecord::Migration
  def self.up
    add_column :rankings, :position, :integer
  end

  def self.down
    remove_column :rankings, :position
  end
end
