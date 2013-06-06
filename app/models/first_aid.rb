class FirstAid < ActiveRecord::Base

  has_many :activity_resources

  structure do
    name
    group_max :integer
    group_min :integer
    recommended_time :time
    description :text
    notes :text

    timestamps
  end

end

