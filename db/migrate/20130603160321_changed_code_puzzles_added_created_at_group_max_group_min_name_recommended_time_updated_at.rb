class ChangedCodePuzzlesAddedCreatedAtGroupMaxGroupMinNameRecommendedTimeUpdatedAt < ActiveRecord::Migration
  def self.up
    add_column :code_puzzles, :created_at, :datetime
    add_column :code_puzzles, :group_max, :integer
    add_column :code_puzzles, :group_min, :integer
    add_column :code_puzzles, :name, :string
    add_column :code_puzzles, :recommended_time, :time
    add_column :code_puzzles, :updated_at, :datetime
  end
  
  def self.down
    remove_column :code_puzzles, :created_at
    remove_column :code_puzzles, :group_max
    remove_column :code_puzzles, :group_min
    remove_column :code_puzzles, :name
    remove_column :code_puzzles, :recommended_time
    remove_column :code_puzzles, :updated_at
  end
end
