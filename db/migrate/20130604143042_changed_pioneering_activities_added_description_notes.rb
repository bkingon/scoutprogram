class ChangedPioneeringActivitiesAddedDescriptionNotes < ActiveRecord::Migration
  def self.up
    add_column :pioneering_activities, :description, :text
    add_column :pioneering_activities, :notes, :text
  end
  
  def self.down
    remove_column :pioneering_activities, :description
    remove_column :pioneering_activities, :notes
  end
end
