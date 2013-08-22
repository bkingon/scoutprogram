# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  created_by_id          :integer
#  updated_by_id          :integer
#

class AdminUser < ActiveRecord::Base
  # include SentientUser
  # track_who_does_it
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :id, :created_by_id, :updated_by_id
  # attr_accessible :title, :body
  validates :id, uniqueness: true

  # before_create :creator
  # before_update :updator

  def creator
    self.created_by_id = current_admin_user.id
  end

  def updator
    self.updated_by_id = params[:id]
  end

end
