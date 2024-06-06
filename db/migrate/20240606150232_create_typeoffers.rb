class CreateTypeoffers < ActiveRecord::Migration[7.1]
  def change
    create_table :typeoffers do |t|
      t.string :type_offer

      t.timestamps
    end
  end
end
