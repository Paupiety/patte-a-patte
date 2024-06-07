class AddCategoryToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :type_offer, :string
  end
end
