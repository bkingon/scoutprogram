class CreateAdminUsersRoles < ActiveRecord::Migration
  def self.up
    create_table(:admin_users_roles, :id => false) do |t|
      t.references :admin_user
      t.references :role
    end

    add_index(:admin_users_roles, [ :admin_user_id, :role_id ])
  end

  def self.down
    drop_table :admin_users_roles
  end
end
