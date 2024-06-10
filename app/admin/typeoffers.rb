ActiveAdmin.register Typeoffer do
  permit_params :type_offer

  index do
    selectable_column
    id_column
    column :type_offer
    column :created_at
    actions
  end

  filter :type_offer
  filter :created_at

  form do |f|
    f.inputs do
      f.input :type_offer
    end
    f.actions
  end
end
