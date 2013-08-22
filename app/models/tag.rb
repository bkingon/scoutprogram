# == Schema Information
#
# Table name: tags
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  created_by_id :integer
#  updated_by_id :integer
#

class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :activities, :through => :taggings

  attr_accessible :name, :created_by_id, :updated_by_id

  # structure do
  #   name :string, validates: :presence
  # end
end
