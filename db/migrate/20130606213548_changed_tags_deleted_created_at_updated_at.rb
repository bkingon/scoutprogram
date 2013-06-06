class ChangedTagsDeletedCreatedAtUpdatedAt < ActiveRecord::Migration
  def self.up
    remove_column :tags, :created_at
    remove_column :tags, :updated_at
  end
  
  def self.down
    add_column :tags, :created_at, :datetime, :limit=>nil, :default=>nil
    add_column :tags, :updated_at, :datetime, :limit=>nil, :default=>nil
  end
end
