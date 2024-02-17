class AddLatitudeToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :latitude, :string
  end
end
