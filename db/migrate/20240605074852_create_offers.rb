class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :type_animal
      t.date :date_publication
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
