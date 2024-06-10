ActiveAdmin.register Category do
  permit_params :type_animal, :offer_id

  index do
    selectable_column
    id_column
    column :type_animal
    column :offer_id
    column :created_at
    actions
  end

  filter :type_animal
  filter :offer_id
  filter :created_at

  form do |f|
    f.inputs do
      f.input :type_animal
      # Ajoutez d'autres champs au besoin
    end
    f.actions
  end
end
