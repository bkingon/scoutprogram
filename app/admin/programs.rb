ActiveAdmin.register Program do
  # controller.authorize_resource

  controller do
    def create
      @program = Program.new(params[:program])
      @program.created_by_id = current_admin_user.id
      create!
    end

    def update
      @program = Program.find(params[:id])
      if @program.update_attributes(params[:program])
        @program.updated_by_id = current_admin_user.id
        @program.save!
        redirect_to admin_admin_users_path
      else
        render "edit"
      end
    end
  end
end
