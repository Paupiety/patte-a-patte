class AddPhotosToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :photo_1, :string
    add_column :offers, :photo_2, :string
  end
end
