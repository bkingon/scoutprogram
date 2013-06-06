class ChangedFirstAidsAddedDescriptionNotes < ActiveRecord::Migration
  def self.up
    add_column :first_aids, :description, :text
    add_column :first_aids, :notes, :text
  end
  
  def self.down
    remove_column :first_aids, :description
    remove_column :first_aids, :notes
  end
end
