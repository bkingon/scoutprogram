ActiveAdmin.register ActivityResource do
  belongs_to :activity

  show do
    attributes_table do
      row :name
      row :description
      row :quantity
    end
  end

end

