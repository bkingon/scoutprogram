class ProgramItem < ActiveRecord::Base
  attr_accessible :activity_id, :duration, :notes, :program_id, :theme, :theme_title

  belongs_to :activity
  belongs_to :program


end
