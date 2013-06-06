class ChangedActivitiesAddedAcceptanceStatus < ActiveRecord::Migration
  def self.up
    add_column :activities, :acceptance_status, :string, :default=>"pending"
  end
  
  def self.down
    remove_column :activities, :acceptance_status
  end
end
