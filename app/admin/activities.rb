ActiveAdmin.register Activity do
  form do |f|
    f.inputs do
      f.input :main_category, :collection => Activity::MAIN_CATEGORIES.invert
      f.input :name
      f.input :group_max
      f.input :group_min
      f.inputs "Recommended Time" do
        f.input :recommended_time_h, as: :select, collection: 0..23
        f.input :recommended_time_m, as: :select, collection: 0..59
      end
      f.input :description
      f.input :notes
      f.input :tags, as: :check_boxes, :collection => Tag.all
    end
    f.actions
  end

  index do
    column :name
    column :acceptance_status
    column :main_category
    column "Recommended Time" do |f|
      f.recommended_time_h.to_s + "h " + f.recommended_time_m.to_s + "m"
    end
    column :group_max
    column "Created By" do |u|
      AdminUser.where(:id => u.created_by_id).map(&:email)
    end
    column "Updated By" do |u|
      AdminUser.where(:id => u.updated_by_id).map(&:email)
    end

    default_actions
  end

  show do |act|
    attributes_table_for activity do
      row :name
      row :main_category
      row :group_min
      row :group_max
      row "Recommended Time" do
        act.recommended_time_h = 0 if act.recommended_time_h.blank?
        act.recommended_time_m = 0 if act.recommended_time_m.blank?
        act.recommended_time_h.to_s + "h" + act.recommended_time_m.to_s + "m"
      end
      row :description
      row :notes
    end
    panel "Resources" do
      div do
        table_for(act.activity_resources) do
          column :name
          column :description
          column :quantity
        end
        div do
          span do
            link_to("Manage Resources", admin_activity_activity_resources_path(act), :class => :button)
          end
        end
      end
    end
    panel "Tags" do
      ul do
        activity.tags.each do |t|
          li t.name
        end
      end
    end
  end

  controller do
    def create
      @activity = Activity.new(params[:activity])
      @activity.created_by_id = current_admin_user.id
      create!
    end

    def update
      @activity = Activity.find(params[:id])
      if @activity.update_attributes(params[:activity])
        @activity.updated_by_id = current_admin_user.id
        @activity.save!
        redirect_to admin_admin_users_path
      else
        render "edit"
      end
    end
  end

  # controller.authorize_resource
end
