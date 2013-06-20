class CreateProgramBuilds < ActiveRecord::Migration
  def self.up
    create_table :program_builds do |t|
      t.integer :activity_id 
      t.integer :program_id 
    end
    add_index :program_builds, :activity_id
    add_index :program_builds, :program_id
  end
  
  def self.down
    drop_table :program_builds
  end
end
