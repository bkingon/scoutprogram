class AddGroupIdToGroupAdmins < ActiveRecord::Migration
  def change
    add_column :group_admins, :group_id, :integer
  end
end
