class CreateActivityResources < ActiveRecord::Migration
  def self.up
    create_table :activity_resources do |t|
      t.string :name 
      t.text :description 
      t.integer :quantity 
    end
  end
  
  def self.down
    drop_table :activity_resources
  end
end
