ActiveAdmin.register Game do
  form do |f|
    f.inputs do
      f.input :name
      f.input :group_max
      f.input :group_min
      f.input :recommended_time, as: :time
      f.input :description
      f.input :notes
    end
    f.actions
  end
end
