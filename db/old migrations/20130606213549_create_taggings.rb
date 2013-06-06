# class CreateTaggings < ActiveRecord::Migration
#   def self.up
#     create_table :taggings do |t|
#       t.integer :tag_id
#       t.integer :activity_id
#     end
#     add_index :taggings, :tag_id
#     add_index :taggings, :activity_id
#   end

#   def self.down
#     drop_table :taggings
#   end
# end
