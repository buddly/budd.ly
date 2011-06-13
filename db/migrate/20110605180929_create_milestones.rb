class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.integer :goal_id
      t.string :name
      t.string :description
      t.string :stage
      t.datetime :ends_at

      t.timestamps
    end
    
    rename_column :goals, :completion_date, :ends_at
  end

  def self.down
    drop_table :milestones
    rename_column :goals, :ends_at, :completion_date
  end
end
