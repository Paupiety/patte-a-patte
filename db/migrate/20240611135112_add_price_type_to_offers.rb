class AddPriceTypeToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :price_type, :string
  end
end
