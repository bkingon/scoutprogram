# == Schema Information
#
# Table name: programs
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  theme             :string(255)
#  theme_description :text
#  created_by_id     :integer
#  updated_by_id     :integer
#  duration          :integer
#

class Program < ActiveRecord::Base

  has_many :program_builds
  has_many :activities, :through => :program_builds

  attr_accessible :name, :created_by_id, :updated_by_id, :theme, :theme_description

  # structure do
  #   name
  #   theme
  #   theme_description :text
  # end
end

