ActiveAdmin.register Offer do
  permit_params :titre, :description, :prix, :type_animal, :date_publication, :user_id

  index do
    selectable_column
    id_column
    column :titre
    column :description
    column :prix
    column :type_animal
    column :date_publication
    column :user
    actions
  end

  filter :titre
  filter :prix
  filter :type_animal
  filter :date_publication
  filter :user

  form do |f|
    f.inputs do
      f.input :titre
      f.input :description
      f.input :prix
      f.input :type_animal
      f.input :date_publication
      f.input :user
    end
    f.actions
  end
end
