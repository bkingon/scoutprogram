class CreateProgramItems < ActiveRecord::Migration
  def change
    create_table :program_items do |t|
      t.integer :activity_id
      t.integer :program_id
      t.text :theme
      t.string :theme_title
      t.text :notes
      t.integer :duration

      t.timestamps
    end
  end
end
