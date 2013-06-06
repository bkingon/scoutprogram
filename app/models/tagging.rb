class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :activity

  structure do
    tag_id :integer
    activity_id :integer
  end
end
