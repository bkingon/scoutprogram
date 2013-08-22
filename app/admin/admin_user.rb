ActiveAdmin.register AdminUser do
  # controller.authorize_resource

  index do |f|
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column "Role" do |u|
      if u.roles.first
        u.roles.first.name.titleize
      end
    end
    column "Created By" do |u|
      AdminUser.where(:id => u.created_by_id).map(&:email)
    end
    column "Updated By" do |u|
      AdminUser.where(:id => u.updated_by_id).map(&:email)
    end
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
      unless current_admin_user.id == params[:id].to_i
        f.input :role, :collection => Role.where(:name => AccessLevels::roles_assignable(current_admin_user.roles.first.name), include_blank: true)
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

    def create
      @admin_user = AdminUser.new(params[:admin_user])
      @admin_user.created_by_id = current_admin_user.id
      create!
    end

    def update
      @admin_user = AdminUser.find(params[:id])
      if @admin_user.update_attributes(params[:admin_user])
        @admin_user.updated_by_id = current_admin_user.id
        @admin_user.save!
        redirect_to admin_admin_users_path
      else
        render "edit"
      end
    end
  end

end
