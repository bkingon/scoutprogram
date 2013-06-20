class Program < ActiveRecord::Base

  has_many :program_builds
  has_many :activities, :through => :program_builds

  structure do
    name
    theme
    theme_description :text
  end
end

