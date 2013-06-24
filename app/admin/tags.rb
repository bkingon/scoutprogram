ActiveAdmin.register Tag do

  # controller.authorize_resource

  controller do
    def create
      @tag = Tag.new(params[:tag])
      @tag.created_by_id = current_admin_user.id
      create!
    end

    def update
      @tag = Tag.find(params[:id])
      if @tag.update_attributes(params[:tag])
        @tag.updated_by_id = current_admin_user.id
        @tag.save!
        redirect_to admin_admin_users_path
      else
        render "edit"
      end
    end
  end
end
