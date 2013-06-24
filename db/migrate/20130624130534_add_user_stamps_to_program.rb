class AddUserStampsToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :created_by_id, :integer
    add_column :programs, :updated_by_id, :integer
  end
end
