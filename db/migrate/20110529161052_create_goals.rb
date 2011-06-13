class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.string  :name, :description
      t.boolean :is_private
      t.integer :creator_id
      t.date    :completion_date
      t.timestamps
    end
  end

  def self.down
    drop_table :goals
  end
end
