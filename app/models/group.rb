class Group < ActiveRecord::Base
  attr_accessible :blurb, :city, :country, :description, :group_type, :logo_file, :name, :province, :street, :suburb

  has_many :group_users
  has_many :users, :through => :group_users
  has_many :group_admins

  def admins
    list_ids = []
    group_admins.each do |ga|
      list_ids << ga.user_id
    end
    list_ids
  end

end
