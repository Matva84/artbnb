class CreateMasterpieces < ActiveRecord::Migration[7.1]
  def change
    create_table :masterpieces do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :category
      t.float :longitude
      t.float :latitude
      t.float :price
      t.boolean :available, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
