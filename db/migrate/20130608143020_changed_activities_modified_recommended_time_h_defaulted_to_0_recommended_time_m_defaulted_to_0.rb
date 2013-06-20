class ChangedActivitiesModifiedRecommendedTimeHDefaultedTo0RecommendedTimeMDefaultedTo0 < ActiveRecord::Migration
  def self.up
    change_column :activities, :recommended_time_h, :integer, :default=>0
    change_column :activities, :recommended_time_m, :integer, :default=>0
  end
  
  def self.down
    change_column :activities, :recommended_time_h, :integer, :limit=>nil, :default=>nil
    change_column :activities, :recommended_time_m, :integer, :limit=>nil, :default=>nil
  end
end
