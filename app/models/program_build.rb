# == Schema Information
#
# Table name: program_builds
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  program_id  :integer
#

class ProgramBuild < ActiveRecord::Base
  belongs_to :activity
  belongs_to :program

end
