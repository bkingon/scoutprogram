class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :activities, :through => :taggings

  attr_accessible :name

  structure do
    name :string, validates: :presence
  end
end
