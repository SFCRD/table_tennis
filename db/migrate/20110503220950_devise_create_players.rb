class DeviseCreatePlayers < ActiveRecord::Migration
  def self.up
    create_table(:players) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      
      t.string :name

      t.timestamps
    end

    add_index :players, :email,                :unique => true
    add_index :players, :reset_password_token, :unique => true
    # add_index :players, :confirmation_token,   :unique => true
    # add_index :players, :unlock_token,         :unique => true
    # add_index :players, :authentication_token, :unique => true
  end

  def self.down
    drop_table :players
  end
end
