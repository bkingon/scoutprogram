class ChangedTrainingsAddedDescriptionNotes < ActiveRecord::Migration
  def self.up
    add_column :trainings, :description, :text
    add_column :trainings, :notes, :text
  end
  
  def self.down
    remove_column :trainings, :description
    remove_column :trainings, :notes
  end
end
