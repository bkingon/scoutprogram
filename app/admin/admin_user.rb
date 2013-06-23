ActiveAdmin.register AdminUser do
  # controller.authorize_resource

  index do |f|
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column "Role" do |u|
      u.roles.first.name.titleize
    end
    # if can? :update, @user
    default_actions
    # end
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      # f.input :id
      f.input :email
      f.input :password
      f.input :password_confirmation
      puts "---HERE----"
      p current_admin_user.id
      p params[:id]
      unless current_admin_user.id == params[:id].to_i
        f.input :roles, :as => :select, :collection => Role.where(:name => AccessLevels::roles_assignable(current_admin_user.roles.first.name))
      end
    end
    f.actions
  end

  controller do

    def index
      index! do
        @user = current_admin_user
      end
    end
  end

end
