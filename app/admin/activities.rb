ActiveAdmin.register Activity do
  form do |f|
    f.inputs do
      f.input :main_category, :collection => Activity::MAIN_CATEGORIES.invert
      f.input :name
      f.input :group_max
      f.input :group_min
      f.input :recommended_time, as: :time
      f.input :description
      f.input :notes
      f.input :tags, as: :check_boxes, :collection => Tag.all
    end
    f.actions
  end

  show do
    attributes_table_for activity do
      row :name
      row :main_category
      row :group_min
      row :group_max
      row :recommended_time
      row :description
      row :notes
    end
    panel "Tags" do
      ul do
        activity.tags.each do |t|
          li t.name
        end
      end
    end
  end
end
