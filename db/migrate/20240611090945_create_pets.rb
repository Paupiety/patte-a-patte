class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.integer :age
      t.string :breed
      t.string :sex
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
