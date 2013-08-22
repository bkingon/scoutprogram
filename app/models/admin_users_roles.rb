# == Schema Information
#
# Table name: admin_users_roles
#
#  admin_user_id :integer
#  role_id       :integer
#

class AdminUsersRoles < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :role
  # structure do
  #   admin_user_id :integer
  #   role_id :integer
  # end
end
