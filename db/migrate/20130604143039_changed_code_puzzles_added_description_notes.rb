class ChangedCodePuzzlesAddedDescriptionNotes < ActiveRecord::Migration
  def self.up
    add_column :code_puzzles, :description, :text
    add_column :code_puzzles, :notes, :text
  end
  
  def self.down
    remove_column :code_puzzles, :description
    remove_column :code_puzzles, :notes
  end
end
