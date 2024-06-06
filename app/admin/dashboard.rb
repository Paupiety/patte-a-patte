ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Stats générales" do
          para "Nombre total d'utilisateurs : #{User.count}"
          para "Nombre total d'offres : #{Offer.count}"
          # Ajoutez d'autres statistiques que vous souhaitez afficher
        end
      end
    end
  end
end
