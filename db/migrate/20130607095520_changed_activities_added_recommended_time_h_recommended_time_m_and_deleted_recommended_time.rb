class ChangedActivitiesAddedRecommendedTimeHRecommendedTimeMAndDeletedRecommendedTime < ActiveRecord::Migration
  def self.up
    add_column :activities, :recommended_time_h, :integer
    add_column :activities, :recommended_time_m, :integer
    remove_column :activities, :recommended_time
  end
  
  def self.down
    add_column :activities, :recommended_time, :time, :limit=>nil, :default=>nil
    remove_column :activities, :recommended_time_h
    remove_column :activities, :recommended_time_m
  end
end
