ActiveAdmin.register Order do
  permit_params :user_id, :cart_id, :created_at, :updated_at, :address_id

  index do
    selectable_column
    id_column
    column :user
    column :cart
    column :address
    column :created_at
    actions
  end

  filter :user_email, as: :string
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user
      f.input :cart
      f.input :address
      # Add other fields as needed
    end
    f.actions
  end
end
