ActiveAdmin.register Pet do
  permit_params :first_name, :age, :breed, :sex, :category_id, :profile_picture

  index do
    selectable_column
    id_column
    column :first_name
    column :age
    column :breed
    column :sex
    column :category
    column :user
    column :created_at
    actions
  end

  filter :first_name
  filter :age
  filter :breed
  filter :sex
  filter :category
  filter :user
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :age
      f.input :breed
      f.input :sex
      f.input :category
      f.input :profile_picture, as: :file
    end
    f.actions
  end
end
