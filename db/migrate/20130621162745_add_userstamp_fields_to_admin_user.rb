class AddUserstampFieldsToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :created_by_id, :integer
    add_column :admin_users, :updated_by_id, :integer
  end
end
