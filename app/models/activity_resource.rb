class ActivityResource < ActiveRecord::Base

  belongs_to :activity

  attr_accessible :activity_id, :name, :description, :quantity

  structure do
    name
    description :text
    quantity :integer
  end
end

