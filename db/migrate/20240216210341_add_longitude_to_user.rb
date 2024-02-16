class AddLongitudeToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :longitude, :string
  end
end
