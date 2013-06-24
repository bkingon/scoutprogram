class AddUserStampsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :created_by_id, :integer
    add_column :activities, :updated_by_id, :integer
  end
end
