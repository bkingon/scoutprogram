class CreateAdminUsersRoles < ActiveRecord::Migration
  def self.up
    create_table :admin_users_roles do |t|
      t.integer :admin_user_id 
      t.integer :role_id 
    end
    add_index :admin_users_roles, :admin_user_id
  end
  
  def self.down
    drop_table :admin_users_roles
  end
end
