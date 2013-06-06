class CreateCodePuzzles < ActiveRecord::Migration
  def self.up
    create_table :code_puzzles do |t|
    end
  end
  
  def self.down
    drop_table :code_puzzles
  end
end
