class CreateMasterpieces < ActiveRecord::Migration[7.1]
  def change
    create_table :masterpieces do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :category
      t.string :longitude
      t.string :latitude
      t.float :price
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
