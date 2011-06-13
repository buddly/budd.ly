class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.integer :goal_id, :user_id
      t.string  :role
      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
