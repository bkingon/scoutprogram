class ActivityResource < ActiveRecord::Base

  has_one :activity

  structure do
    name
    description :text
    quantity :integer
  end
end

