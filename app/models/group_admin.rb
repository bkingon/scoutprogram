class GroupAdmin < ActiveRecord::Base
  attr_accessible :admin_level, :user_id

  belongs_to :group
end
