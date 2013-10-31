class CreateGroupAdmins < ActiveRecord::Migration
  def change
    create_table :group_admins do |t|
      t.integer :user_id
      t.string :admin_level

      t.timestamps
    end
  end
end
