class AddProfilePictureToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :profile_picture, :string
  end
end
