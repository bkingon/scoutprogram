class ProgramBuild < ActiveRecord::Base
  belongs_to :activity
  belongs_to :program

  structure do
    program_id :integer
    activity_id :integer
  end
end
