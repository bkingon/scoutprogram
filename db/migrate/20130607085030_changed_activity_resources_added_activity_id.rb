class ChangedActivityResourcesAddedActivityId < ActiveRecord::Migration
  def self.up
    add_column :activity_resources, :activity_id, :integer
    add_index :activity_resources, :activity_id
  end
  
  def self.down
    remove_column :activity_resources, :activity_id
  end
end
