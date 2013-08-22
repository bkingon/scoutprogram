class ChangedProgramsAddedDuration < ActiveRecord::Migration
  def self.up
    add_column :programs, :duration, :integer
  end
  
  def self.down
    remove_column :programs, :duration
  end
end
