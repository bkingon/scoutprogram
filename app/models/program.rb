class Program < ActiveRecord::Base
  structure do
    name
    theme
    theme_description :text
  end
end

