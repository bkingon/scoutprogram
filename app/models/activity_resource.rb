class ActivityResource < ActiveRecord::Base

  has_one :game
  has_one :first_aid
  has_one :pioneering_activity
  has_one :training
  has_one :code_puzzle

  structure do
    name
    description :text
    quantity :integer
  end
end

