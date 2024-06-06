class Category < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |c|
      c.string :type_animal
      c.belongs_to :offer, index: true
      c.timestamps
    end
  end
end
