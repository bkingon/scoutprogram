ActiveAdmin.register AdminUser do
  controller.authorize_resource

  index do |f|
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    # if can? :update, @user
    default_actions
    # end
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
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
