ActiveAdmin.register Comment do
  permit_params :title, :content, :user_id, :offer_id

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :user
    column :offer
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :content
  filter :user
  filter :offer
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :user
      f.input :offer
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :content
      row :user
      row :offer
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end



