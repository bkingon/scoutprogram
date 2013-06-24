class AddUserStampsToTag < ActiveRecord::Migration
  def change
    add_column :tags, :created_by_id, :integer
    add_column :tags, :updated_by_id, :integer
  end
end
