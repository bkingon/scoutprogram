# == Schema Information
#
# Table name: activity_resources
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  quantity    :integer
#  activity_id :integer
#

class ActivityResource < ActiveRecord::Base

  belongs_to :activity

  attr_accessible :activity_id, :name, :description, :quantity

  # structure do
  #   name
  #   description :text
  #   quantity :integer
  # end
end

