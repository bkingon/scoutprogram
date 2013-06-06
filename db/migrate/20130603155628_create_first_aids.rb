class CreateFirstAids < ActiveRecord::Migration
  def self.up
    create_table :first_aids do |t|
      t.string :name 
      t.integer :group_max 
      t.integer :group_min 
      t.time :recommended_time 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :first_aids
  end
end
