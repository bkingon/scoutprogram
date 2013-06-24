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
