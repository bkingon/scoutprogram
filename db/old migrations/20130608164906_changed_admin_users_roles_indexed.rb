class ChangedAdminUsersRolesIndexed < ActiveRecord::Migration
  def self.up
    add_index :admin_users_roles, :role_id
  end

  def self.down
  end
end
