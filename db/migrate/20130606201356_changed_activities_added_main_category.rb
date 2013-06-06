class ChangedActivitiesAddedMainCategory < ActiveRecord::Migration
  def self.up
    add_column :activities, :main_category, :string
  end
  
  def self.down
    remove_column :activities, :main_category
  end
end
