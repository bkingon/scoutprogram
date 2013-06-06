class ChangedGamesAddedDescriptionNotes < ActiveRecord::Migration
  def self.up
    add_column :games, :description, :text
    add_column :games, :notes, :text
  end
  
  def self.down
    remove_column :games, :description
    remove_column :games, :notes
  end
end
