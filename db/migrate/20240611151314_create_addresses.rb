class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.integer :zip_code
      t.string :city_name
      t.string :address_name

      t.timestamps
    end
  end
end
