class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_type
      t.string :country
      t.string :province
      t.string :city
      t.string :suburb
      t.string :street
      t.string :blurb
      t.string :description
      t.string :logo_file

      t.timestamps
    end
  end
end
