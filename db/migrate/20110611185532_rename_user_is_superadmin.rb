class RenameUserIsSuperadmin < ActiveRecord::Migration
  def self.up
    rename_column :users, :is_superadmin, :superadmin
  end

  def self.down
    rename_column :users, :superadmin, :is_superadmin
  end
end
