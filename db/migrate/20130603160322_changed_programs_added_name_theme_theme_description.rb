class ChangedProgramsAddedNameThemeThemeDescription < ActiveRecord::Migration
  def self.up
    add_column :programs, :name, :string
    add_column :programs, :theme, :string
    add_column :programs, :theme_description, :text
  end
  
  def self.down
    remove_column :programs, :name
    remove_column :programs, :theme
    remove_column :programs, :theme_description
  end
end
