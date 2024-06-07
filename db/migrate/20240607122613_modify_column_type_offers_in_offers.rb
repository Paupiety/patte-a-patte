class ModifyColumnTypeOffersInOffers < ActiveRecord::Migration[7.1]
  def change
    rename_column :offers, :type_offer, :type_offer_id
    change_column :offers, :type_offer_id, 'bigint USING CAST(type_offer_id AS bigint)'
  end
end
