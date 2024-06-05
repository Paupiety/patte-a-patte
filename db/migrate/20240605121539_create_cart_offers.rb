class CreateCartOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_offers do |t|
      t.belongs_to :cart
      t.belongs_to :offer
      t.timestamps
    end
  end
end
