class Activity < ActiveRecord::Base

  has_many :activity_resources
  has_many :taggings
  has_many :tags, :through => :taggings
  has_many :program_builds
  has_many :programs, :through => :program_builds

  attr_accessible :name, :group_max, :group_min, :recommended_time_h, :recommended_time_m, :description, :notes, :acceptance_status, :main_category, :tag_ids

  MAIN_CATEGORIES = {games: "Games", first_aid: "First Aid", pioneering: "Pioneering", codes: "Codes and Puzzles", training: "Training"}
  ACCEPTANCE_STATES = {:pending => "pending", :accepted => "accepted", :rejected => "rejected"}

  structure do
    name :string, validates: :uniqueness
    group_max :integer
    group_min :integer
    recommended_time_h :integer, default: 0
    recommended_time_m :integer, default: 0
    description :text, validates: :presence
    notes :text
    acceptance_status :default => ACCEPTANCE_STATES[:pending]
    main_category :string

    timestamps
  end

  ACCEPTANCE_STATES.each_pair do |key, value|
    scope key.to_sym, where(:acceptance_status => value)
  end
  MAIN_CATEGORIES.each_pair do |key, value|
    scope key.to_sym, where(:main_category => value)
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

end

